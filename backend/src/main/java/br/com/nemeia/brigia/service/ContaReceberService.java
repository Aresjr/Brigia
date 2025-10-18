package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.ValorRecebidoUltrapassadoException;
import br.com.nemeia.brigia.model.StatusContaReceber;
import br.com.nemeia.brigia.utils.BigDecimals;
import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ContaReceberMapper;
import br.com.nemeia.brigia.model.Agendamento;
import br.com.nemeia.brigia.model.ContaReceber;
import br.com.nemeia.brigia.repository.ContaReceberRepository;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ContaReceberService {

    private final ContaReceberRepository repository;
    private final ContaReceberMapper mapper;

    @Transactional(readOnly = true)
    public Page<ContaReceber> getPaged(int page, int size) {
        log.info("Buscando contas a receber paginadas - page: {}, size: {}", page, size);
        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);
        return repository.findAllByUnidadeIdIs(pageable, SecurityHolder.getLoggedUserUnidadeId());
    }

    @Transactional(readOnly = true)
    public ContaReceber getById(Long id) {
        log.info("Buscando conta a receber por ID: {}", id);
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Conta a receber não encontrada"));
    }

    @Transactional
    public void createContaReceberFromAgendamento(Agendamento agendamento) {
        ContaReceber contaReceber = mapper.fromAgendamento(agendamento);
        repository.save(contaReceber);
    }

    @Transactional
    public ContaReceber registrarRecebimento(Long id, BigDecimal valorRecebido) {
        ContaReceber contaReceber = getById(id);
        if (BigDecimals.gt(valorRecebido, contaReceber.getValorTotal())) {
            throw new ValorRecebidoUltrapassadoException();
        }
        contaReceber.setValorRecebido(contaReceber.getValorRecebido().add(valorRecebido));
        boolean pagoTotalmente = contaReceber.getValorRecebido().equals(contaReceber.getValorTotal());
        var status = pagoTotalmente ? StatusContaReceber.PAGO : StatusContaReceber.PARCIAL;
        contaReceber.setStatus(status);
        repository.save(contaReceber);
        return contaReceber;
    }

    @Transactional(readOnly = true)
    public byte[] gerarPDF(List<Long> ids) {
        log.info("Gerando PDF para contas a receber: {}", ids);
        List<ContaReceber> contas = repository.findAllById(ids);

        if (contas.isEmpty()) {
            throw new NotFoundException("Nenhuma conta a receber encontrada");
        }

        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);

            // Título
            Paragraph titulo = new Paragraph("Resumo de Contas a Receber")
                    .setFontSize(18)
                    .setBold()
                    .setTextAlignment(TextAlignment.CENTER);
            document.add(titulo);

            // Data de geração
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            Paragraph dataGeracao = new Paragraph("Data: " + LocalDate.now().format(formatter))
                    .setFontSize(10)
                    .setTextAlignment(TextAlignment.RIGHT);
            document.add(dataGeracao);

            // Informações do filtro (Empresa ou Paciente)
            ContaReceber primeiraConta = contas.get(0);
            if (primeiraConta.getEmpresa() != null) {
                Paragraph empresa = new Paragraph("Empresa: " + primeiraConta.getEmpresa().getNome())
                        .setFontSize(12)
                        .setBold()
                        .setMarginTop(10);
                document.add(empresa);
            } else {
                Paragraph paciente = new Paragraph("Paciente: " + primeiraConta.getPaciente().getNome())
                        .setFontSize(12)
                        .setBold()
                        .setMarginTop(10);
                document.add(paciente);
            }

            document.add(new Paragraph("\n"));

            // Tabela
            float[] columnWidths = {1, 3, 2, 2, 2};
            Table table = new Table(UnitValue.createPercentArray(columnWidths));
            table.setWidth(UnitValue.createPercentValue(100));

            // Cabeçalho da tabela
            String[] headers = {"#", "Paciente", "Data", "Convênio", "Valor Total"};
            for (String header : headers) {
                Cell cell = new Cell()
                        .add(new Paragraph(header).setBold())
                        .setBackgroundColor(ColorConstants.LIGHT_GRAY)
                        .setTextAlignment(TextAlignment.CENTER);
                table.addHeaderCell(cell);
            }

            // Dados
            BigDecimal totalGeral = BigDecimal.ZERO;
            int contador = 1;

            for (ContaReceber conta : contas) {
                table.addCell(new Cell().add(new Paragraph(String.valueOf(contador++))));
                table.addCell(new Cell().add(new Paragraph(conta.getPaciente().getNome())));
                table.addCell(new Cell().add(new Paragraph(conta.getDataAgendamento().format(formatter))));
                table.addCell(new Cell().add(new Paragraph(conta.getConvenio() != null ? conta.getConvenio().getNome() : "N/A")));
                table.addCell(new Cell()
                        .add(new Paragraph(String.format("R$ %.2f", conta.getValorTotal())))
                        .setTextAlignment(TextAlignment.RIGHT));

                totalGeral = totalGeral.add(conta.getValorTotal());
            }

            // Linha de total
            table.addCell(new Cell(1, 4)
                    .add(new Paragraph("TOTAL").setBold())
                    .setTextAlignment(TextAlignment.RIGHT)
                    .setBackgroundColor(ColorConstants.LIGHT_GRAY));
            table.addCell(new Cell()
                    .add(new Paragraph(String.format("R$ %.2f", totalGeral)).setBold())
                    .setTextAlignment(TextAlignment.RIGHT)
                    .setBackgroundColor(ColorConstants.LIGHT_GRAY));

            document.add(table);

            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erro ao gerar PDF", e);
            throw new RuntimeException("Erro ao gerar PDF", e);
        }
    }
}
