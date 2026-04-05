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
import br.com.nemeia.brigia.repository.AgendamentoRepository;
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
    private final AgendamentoRepository agendamentoRepository;

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
    public void deleteContaReceberByAgendamento(Long agendamentoId) {
        log.info("Buscando conta a receber para agendamento ID: {}", agendamentoId);
        repository.findByAgendamentoId(agendamentoId).ifPresent(contaReceber -> {
            log.info("Excluindo conta a receber ID: {} do agendamento ID: {}", contaReceber.getId(), agendamentoId);
            repository.delete(contaReceber);
        });
    }

    @Transactional
    public void sincronizarContaReceberComAgendamento(Long agendamentoId, Agendamento agendamentoAtualizado,
            Boolean pago, BigDecimal quantiaPaga) {
        log.info("Sincronizando conta a receber para agendamento ID: {}", agendamentoId);

        var contaReceberOptional = repository.findByAgendamentoId(agendamentoId);

        if (contaReceberOptional.isEmpty()) {
            // Se não existe CR, criar um novo se o agendamento foi pago
            if (Boolean.TRUE.equals(pago) || (quantiaPaga != null && quantiaPaga.compareTo(BigDecimal.ZERO) > 0)) {
                log.info("Criando nova conta a receber para agendamento ID: {}", agendamentoId);
                createContaReceberFromAgendamento(agendamentoAtualizado);
            }
            return;
        }

        ContaReceber contaReceber = contaReceberOptional.get();

        // 🔵 Cenário 3: CR foi alterado, mas o valor do agendamento não mudou
        BigDecimal novoValorTotal = calcularValorTotalAgendamento(agendamentoAtualizado);
        BigDecimal valorTotalAnterior = contaReceber.getValorTotal();

        if (novoValorTotal.compareTo(valorTotalAnterior) == 0) {
            log.info("Valor do agendamento não mudou. Nada a fazer no CR ID: {}", contaReceber.getId());
            return;
        }

        // 🟠 Cenário 2: CR foi alterado manualmente
        if (Boolean.TRUE.equals(contaReceber.getAtualizadoManual())) {
            log.warn(
                    "CR ID: {} foi alterado manualmente. Não atualizando automaticamente. "
                            + "Agendamento ID: {} teve mudança de valor de {} para {}",
                    contaReceber.getId(), agendamentoId, valorTotalAnterior, novoValorTotal);
            // TODO: Criar notificação ou flag para revisão manual
            return;
        }

        // 🟢 Cenário 1: CR não foi alterado manualmente - pode atualizar
        // automaticamente
        log.info("Atualizando automaticamente CR ID: {} conforme agendamento ID: {}. Valor: {} -> {}",
                contaReceber.getId(), agendamentoId, valorTotalAnterior, novoValorTotal);

        // Atualizar valores do CR
        ContaReceber novoContaReceber = mapper.fromAgendamento(agendamentoAtualizado);
        contaReceber.setValorAgendamento(novoContaReceber.getValorAgendamento());
        contaReceber.setValorProcedimentosAdicionais(novoContaReceber.getValorProcedimentosAdicionais());
        contaReceber.setValorDesconto(novoContaReceber.getValorDesconto());
        contaReceber.setDataAgendamento(novoContaReceber.getDataAgendamento());
        contaReceber.setProfissional(novoContaReceber.getProfissional());
        contaReceber.setConvenio(novoContaReceber.getConvenio());
        contaReceber.setEmpresa(novoContaReceber.getEmpresa());

        // Recalcular status baseado no novo valor total
        BigDecimal valorRecebido = contaReceber.getValorRecebido();
        if (valorRecebido.compareTo(BigDecimal.ZERO) == 0) {
            contaReceber.setStatus(StatusContaReceber.ABERTO);
        } else if (valorRecebido.compareTo(novoValorTotal) >= 0) {
            contaReceber.setStatus(StatusContaReceber.PAGO);
        } else {
            contaReceber.setStatus(StatusContaReceber.PARCIAL);
        }

        repository.save(contaReceber);
        log.info("CR ID: {} atualizado com sucesso", contaReceber.getId());
    }

    private BigDecimal calcularValorTotalAgendamento(Agendamento agendamento) {
        BigDecimal valorTotal = agendamento.getValor() != null ? agendamento.getValor() : BigDecimal.ZERO;
        BigDecimal desconto = agendamento.getDesconto() != null ? agendamento.getDesconto() : BigDecimal.ZERO;

        if (agendamento.getProcedimentos() != null) {
            for (var proc : agendamento.getProcedimentos()) {
                BigDecimal valorProc = proc.getValor() != null ? proc.getValor() : BigDecimal.ZERO;
                BigDecimal descontoProc = proc.getDesconto() != null ? proc.getDesconto() : BigDecimal.ZERO;
                BigDecimal quantidade = BigDecimal.valueOf(proc.getQuantidade());
                valorTotal = valorTotal.add(valorProc.multiply(quantidade).subtract(descontoProc));
            }
        }

        return valorTotal.subtract(desconto);
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

        // Marcar como atualizado manualmente ao registrar recebimento
        contaReceber.setAtualizadoManual(true);


        // 🔄 Sincronizar pagamento com o Agendamento
        sincronizarPagamentoComAgendamento(contaReceber);

        repository.save(contaReceber);
        return contaReceber;
    }

    @Transactional
    public ContaReceber atualizarDesconto(Long id, BigDecimal desconto) {
        log.info("Atualizando desconto da conta a receber ID: {} para: {}", id, desconto);
        ContaReceber contaReceber = getById(id);

        // Validar que o desconto não seja maior que o valor sem desconto
        BigDecimal valorSemDesconto = contaReceber.getValorAgendamento()
                .add(contaReceber.getValorProcedimentosAdicionais());

        if (BigDecimals.gt(desconto, valorSemDesconto)) {
            throw new IllegalArgumentException("O desconto não pode ser maior que o valor total");
        }

        // Atualizar o desconto
        contaReceber.setValorDesconto(desconto);

        // Marcar como atualizado manualmente ao alterar desconto
        contaReceber.setAtualizadoManual(true);

        // Recalcular o status baseado no novo valor total
        BigDecimal novoValorTotal = contaReceber.getValorTotal();
        BigDecimal valorRecebido = contaReceber.getValorRecebido();

        if (valorRecebido.compareTo(BigDecimal.ZERO) == 0) {
            contaReceber.setStatus(StatusContaReceber.ABERTO);
        } else if (valorRecebido.compareTo(novoValorTotal) >= 0) {
            contaReceber.setStatus(StatusContaReceber.PAGO);
        } else {
            contaReceber.setStatus(StatusContaReceber.PARCIAL);
        }

        repository.save(contaReceber);

        // 🔄 Sincronizar pagamento com o Agendamento quando o desconto é alterado
        sincronizarPagamentoComAgendamento(contaReceber);

        return contaReceber;
    }

    @Transactional
    private void sincronizarPagamentoComAgendamento(ContaReceber contaReceber) {
        if (contaReceber.getAgendamento() == null) {
            log.warn("ContaReceber ID: {} não possui agendamento associado", contaReceber.getId());
            return;
        }

        Agendamento agendamento = contaReceber.getAgendamento();
        log.info("Sincronizando pagamento do agendamento ID: {} - Valor recebido: {}, Status: {}",
                agendamento.getId(), contaReceber.getValorRecebido(), contaReceber.getStatus());

        // Atualizar o valor pago no agendamento
        agendamento.setQuantiaPaga(contaReceber.getValorRecebido());

        // Marcar como pago se o pagamento está completo
        if (contaReceber.getStatus() == StatusContaReceber.PAGO) {
            agendamento.setPago(true);
            log.info("Agendamento ID: {} marcado como PAGO", agendamento.getId());
        } else if (contaReceber.getStatus() == StatusContaReceber.PARCIAL) {
            agendamento.setPago(false);
            log.info("Agendamento ID: {} marcado como PARCIALMENTE PAGO", agendamento.getId());
        }

        agendamentoRepository.save(agendamento);
        log.info("Agendamento ID: {} sincronizado com sucesso", agendamento.getId());
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
            Paragraph titulo = new Paragraph("Resumo de Contas a Receber").setFontSize(18).setBold()
                    .setTextAlignment(TextAlignment.CENTER);
            document.add(titulo);

            // Data de geração
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            Paragraph dataGeracao = new Paragraph("Data: " + LocalDate.now().format(formatter)).setFontSize(10)
                    .setTextAlignment(TextAlignment.RIGHT);
            document.add(dataGeracao);

            // Informações do filtro (Empresa ou Paciente)
            ContaReceber primeiraConta = contas.get(0);
            if (primeiraConta.getEmpresa() != null) {
                Paragraph empresa = new Paragraph("Empresa: " + primeiraConta.getEmpresa().getNome()).setFontSize(12)
                        .setBold().setMarginTop(10);
                document.add(empresa);
            } else {
                Paragraph paciente = new Paragraph("Paciente: " + primeiraConta.getPaciente().getNome()).setFontSize(12)
                        .setBold().setMarginTop(10);
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
                Cell cell = new Cell().add(new Paragraph(header).setBold())
                        .setBackgroundColor(ColorConstants.LIGHT_GRAY).setTextAlignment(TextAlignment.CENTER);
                table.addHeaderCell(cell);
            }

            // Dados
            BigDecimal totalGeral = BigDecimal.ZERO;
            int contador = 1;

            for (ContaReceber conta : contas) {
                table.addCell(new Cell().add(new Paragraph(String.valueOf(contador++))));
                table.addCell(new Cell().add(new Paragraph(conta.getPaciente().getNome())));
                table.addCell(new Cell().add(new Paragraph(conta.getDataAgendamento().format(formatter))));
                table.addCell(new Cell()
                        .add(new Paragraph(conta.getConvenio() != null ? conta.getConvenio().getNome() : "N/A")));
                table.addCell(new Cell().add(new Paragraph(String.format("R$ %.2f", conta.getValorTotal())))
                        .setTextAlignment(TextAlignment.RIGHT));

                totalGeral = totalGeral.add(conta.getValorTotal());
            }

            // Linha de total
            table.addCell(new Cell(1, 4).add(new Paragraph("TOTAL").setBold()).setTextAlignment(TextAlignment.RIGHT)
                    .setBackgroundColor(ColorConstants.LIGHT_GRAY));
            table.addCell(new Cell().add(new Paragraph(String.format("R$ %.2f", totalGeral)).setBold())
                    .setTextAlignment(TextAlignment.RIGHT).setBackgroundColor(ColorConstants.LIGHT_GRAY));

            document.add(table);

            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            log.error("Erro ao gerar PDF", e);
            throw new RuntimeException("Erro ao gerar PDF", e);
        }
    }
}
