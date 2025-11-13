package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.dto.response.AgendamentoDetalhesResponse;
import br.com.nemeia.brigia.dto.response.AgendamentoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.ProcedimentoAgendamentoResponse;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.Agendamento;
import br.com.nemeia.brigia.model.AgendamentoProcedimento;
import br.com.nemeia.brigia.service.ProcedimentoPrecoResolver;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class AgendamentoMapper {

    private final ObjectMapper objectMapper;
    private final PacienteMapper pacienteMapper;
    private final UnidadeMapper unidadeMapper;
    private final EspecialidadeMapper especialidadeMapper;
    private final ProfissionalMapper profissionalMapper;
    private final ProcedimentoMapper procedimentoMapper;
    private final EmpresaMapper empresaMapper;
    private final ConvenioMapper convenioMapper;
    private final ProcedimentoPrecoResolver procedimentoPrecoResolver;

    public AgendamentoResponse toResponse(Agendamento agendamento) {
        if (agendamento == null) {
            return null;
        }

        List<ProcedimentoAgendamentoResponse> procedimentos = new ArrayList<>();
        if (agendamento.getProcedimentos() != null) {
            procedimentos = agendamento.getProcedimentos().stream().map(this::toProcedimentoAgendamentoResponse)
                    .toList();
        }

        BigDecimal valorRepassePrincipal = calcularValorRepassePrincipal(agendamento);

        return new AgendamentoResponse(agendamento.getId(), pacienteMapper.toResponse(agendamento.getPaciente()),
                agendamento.getData(), agendamento.getHora(),
                agendamento.getHora().plusMinutes(agendamento.getDuracao()),
                unidadeMapper.toResponse(agendamento.getUnidade()),
                especialidadeMapper.toResponse(agendamento.getEspecialidade()),
                empresaMapper.toResponse(agendamento.getEmpresa()),
                convenioMapper.toResponse(agendamento.getConvenio()),
                profissionalMapper.toResponse(agendamento.getProfissional()),
                procedimentoMapper.toResponse(agendamento.getProcedimento()), agendamento.getStatus(),
                agendamento.getTipoAgendamento(), agendamento.getFormaPagamento(), agendamento.getValor(),
                agendamento.getDesconto(), agendamento.getObservacoes(), agendamento.getDuracao(),
                agendamento.getEncaixe(), agendamento.getPago(), procedimentos, valorRepassePrincipal, BigDecimal.ZERO,
                agendamento.getCriadoEm(), agendamento.getExcluido());
    }

    private ProcedimentoAgendamentoResponse toProcedimentoAgendamentoResponse(AgendamentoProcedimento ap) {
        return new ProcedimentoAgendamentoResponse(ap.getId(), procedimentoMapper.toResponse(ap.getProcedimento()),
                ap.getQuantidade(), ap.getValor(), ap.getValorRepasse());
    }

    public AgendamentoDetalhesResponse toDetalhesResponse(Agendamento agendamento) {
        if (agendamento == null) {
            return null;
        }

        return new AgendamentoDetalhesResponse(agendamento.getPaciente().getNome(), agendamento.getData(),
                agendamento.getHora(), agendamento.getHora().plusMinutes(agendamento.getDuracao()),
                agendamento.getUnidade().getNome(), agendamento.getUnidade().getEndereco(),
                agendamento.getProfissional().getNome(), agendamento.getStatus());
    }

    public PagedResponse<AgendamentoResponse> toPagedResponse(Page<Agendamento> paged) {
        List<AgendamentoResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public Agendamento toEntity(AgendamentoRequest request) {
        if (request == null) {
            return null;
        }
        return objectMapper.convertValue(request, Agendamento.class);
    }

    public Agendamento updateEntity(Agendamento original, AgendamentoRequest request) {
        original.setData(request.data());
        original.setHora(request.hora());
        original.setTipoAgendamento(request.tipoAgendamento());
        original.setFormaPagamento(request.formaPagamento());
        original.setValor(request.valor());
        original.setDesconto(request.desconto());
        original.setDuracao(request.duracao());
        original.setObservacoes(request.observacoes());
        original.setPrecoAlterado(request.precoAlterado());
        original.setEncaixe(request.encaixe() != null ? request.encaixe() : false);
        original.setPago(request.pago() != null ? request.pago() : false);
        return original;
    }

    private BigDecimal calcularValorRepassePrincipal(Agendamento agendamento) {
        if (agendamento.getProcedimento() == null) {
            return null;
        }
        try {
            return procedimentoPrecoResolver.resolve(agendamento.getProcedimento(), agendamento.getConvenio(),
                    agendamento.getEmpresa(), agendamento.getUnidade()).repasseOrZero();
        } catch (NotFoundException e) {
            return null;
        }
    }
}
