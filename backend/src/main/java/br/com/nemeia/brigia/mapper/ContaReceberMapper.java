package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Optional;

@Component
public class ContaReceberMapper extends BaseMapper<ContaReceber, Void, ContaReceberResponse> {

    private final PacienteMapper pacienteMapper;
    private final EmpresaMapper empresaMapper;
    private final ProfissionalMapper profissionalMapper;

    public ContaReceberMapper(ObjectMapper objectMapper, PacienteMapper pacienteMapper, EmpresaMapper empresaMapper,
            ProfissionalMapper profissionalMapper) {
        super(objectMapper, ContaReceber.class, ContaReceberResponse.class);
        this.pacienteMapper = pacienteMapper;
        this.empresaMapper = empresaMapper;
        this.profissionalMapper = profissionalMapper;
    }

    public ContaReceberResponse toResponse(ContaReceber contaReceber) {
        if (contaReceber == null) {
            return null;
        }

        return new ContaReceberResponse(contaReceber.getId(), pacienteMapper.toResponse(contaReceber.getPaciente()),
                empresaMapper.toResponse(contaReceber.getEmpresa()),
                profissionalMapper.toResponse(contaReceber.getProfissional()), contaReceber.getDataAgendamento(),
                contaReceber.getValorAgendamento(), contaReceber.getValorDesconto(),
                contaReceber.getValorTotalLancado(), contaReceber.getValorTotal(), contaReceber.getValorRecebido(),
                contaReceber.getConvenio() != null ? contaReceber.getConvenio().getNome() : null,
                contaReceber.getFormaPagamento(), contaReceber.getStatus(), contaReceber.isFaturado());
    }

    public ContaReceber fromAgendamento(Agendamento agendamento) {
        if (agendamento == null) {
            return null;
        }

        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setAgendamento(agendamento);
        contaReceber.setPaciente(agendamento.getPaciente());
        contaReceber.setEmpresa(agendamento.getEmpresa());
        contaReceber.setProfissional(agendamento.getProfissional());
        contaReceber.setConvenio(agendamento.getConvenio());
        contaReceber.setDataAgendamento(agendamento.getData());
        contaReceber.setValorAgendamento(agendamento.getValor());
        contaReceber.setValorDesconto(agendamento.getDesconto() != null ? agendamento.getDesconto() : BigDecimal.ZERO);
        contaReceber.setValorTotalLancado(BigDecimal.ZERO);
        contaReceber.setFormaPagamento(agendamento.getFormaPagamento());
        var statusContaReceber = agendamento.getPago() ? StatusContaReceber.PAGO : StatusContaReceber.ABERTO;
        contaReceber.setStatus(statusContaReceber);
        var valorRecebido = agendamento.getPago()
                ? agendamento.getValor()
                        .subtract(Optional.ofNullable(agendamento.getDesconto()).orElse(BigDecimal.ZERO))
                : BigDecimal.ZERO;
        contaReceber.setValorRecebido(valorRecebido);

        return contaReceber;
    }

    public ContaReceber fromAtendimento(Atendimento atendimento) {
        if (atendimento == null || atendimento.getAgendamento() == null) {
            return null;
        }

        Agendamento agendamento = atendimento.getAgendamento();
        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setAgendamento(agendamento);
        contaReceber.setPaciente(agendamento.getPaciente());
        contaReceber.setEmpresa(agendamento.getEmpresa());
        contaReceber.setProfissional(agendamento.getProfissional());
        contaReceber.setConvenio(agendamento.getConvenio());
        contaReceber.setDataAgendamento(agendamento.getData());

        // Valor do agendamento
        contaReceber.setValorAgendamento(agendamento.getValor());

        // Valor de procedimentos adicionais lan\u00e7ados no atendimento
        BigDecimal valorLancado = Optional.ofNullable(atendimento.getValorLancado()).orElse(BigDecimal.ZERO);
        contaReceber.setValorTotalLancado(valorLancado);

        // Desconto do agendamento
        contaReceber.setValorDesconto(
            Optional.ofNullable(agendamento.getDesconto()).orElse(BigDecimal.ZERO)
        );

        contaReceber.setFormaPagamento(agendamento.getFormaPagamento());
        contaReceber.setStatus(StatusContaReceber.ABERTO);
        contaReceber.setValorRecebido(BigDecimal.ZERO);

        return contaReceber;
    }
}
