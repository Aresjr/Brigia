package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Agendamento;
import br.com.nemeia.brigia.model.ContaReceber;
import org.springframework.data.domain.Page;
import br.com.nemeia.brigia.model.StatusContaReceber;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ContaReceberMapper {

    private final PacienteMapper pacienteMapper;
    private final EmpresaMapper empresaMapper;
    private final ProfissionalMapper profissionalMapper;

    public ContaReceberResponse toResponse(ContaReceber contaReceber) {
        if (contaReceber == null) {
            return null;
        }

        return new ContaReceberResponse(contaReceber.getId(), pacienteMapper.toResponse(contaReceber.getPaciente()),
                empresaMapper.toResponse(contaReceber.getEmpresa()),
                profissionalMapper.toResponse(contaReceber.getProfissional()), contaReceber.getAtendimento().getData(),
                contaReceber.getValorAtendimento(), contaReceber.getValorDesconto(),
                contaReceber.getValorTotalLancado(), contaReceber.getValorTotal(), contaReceber.getValorRecebido(),
                contaReceber.getAtendimento().getConvenio() != null
                        ? contaReceber.getAtendimento().getConvenio().getNome()
                        : null,
                contaReceber.getFormaPagamento(), contaReceber.getStatus(), contaReceber.isFaturado());
    }

    public PagedResponse<ContaReceberResponse> toPagedResponse(Page<ContaReceber> paged) {
        List<ContaReceberResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public ContaReceber fromAgendamento(Agendamento agendamento) {
        if (agendamento == null) {
            return null;
        }

        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setPaciente(agendamento.getPaciente());
        contaReceber.setEmpresa(agendamento.getEmpresa());
        contaReceber.setAtendimento(null);
        contaReceber.setProfissional(agendamento.getProfissional());
        contaReceber.setValorAtendimento(agendamento.getValor());
        contaReceber.setValorDesconto(agendamento.getDesconto() != null ? agendamento.getDesconto() : BigDecimal.ZERO);
        contaReceber.setValorTotalLancado(BigDecimal.ZERO);
        contaReceber.setFormaPagamento(agendamento.getFormaPagamento());
        var statusContaReceber = agendamento.getPago() ? StatusContaReceber.PAGO : StatusContaReceber.ABERTO;
        contaReceber.setStatus(statusContaReceber);
        var valorRecebido = agendamento.getPago() ? agendamento.getValor().subtract(Optional.ofNullable(agendamento.getDesconto()).orElse(BigDecimal.ZERO)) : BigDecimal.ZERO;
        contaReceber.setValorRecebido(valorRecebido);

        return contaReceber;
    }
}
