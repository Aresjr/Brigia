package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Atendimento;
import br.com.nemeia.brigia.model.ContaReceber;
import org.springframework.data.domain.Page;
import br.com.nemeia.brigia.model.StatusContaReceber;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

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
                contaReceber.getValorAtendimento(), contaReceber.getDescontoAtendimento(), contaReceber.getValorTotalLancado(),
                contaReceber.getValorTotal(), contaReceber.getValorRecebido(), contaReceber.getFormaPagamento(), contaReceber.getStatus());
    }

    public PagedResponse<ContaReceberResponse> toPagedResponse(Page<ContaReceber> paged) {
        List<ContaReceberResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public ContaReceber fromAtendimento(Atendimento atendimento) {
        if (atendimento == null) {
            return null;
        }

        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setPaciente(atendimento.getPaciente());
        contaReceber.setEmpresa(atendimento.getEmpresa());
        contaReceber.setAtendimento(atendimento);
        contaReceber.setProfissional(atendimento.getProfissional());
        contaReceber.setValorAtendimento(atendimento.getValorAgendamento());
        contaReceber.setValorDesconto(atendimento.getAgendamento().getDesconto());
        contaReceber.setValorTotal(atendimento.getValorTotal());
        contaReceber.setFormaPagamento(atendimento.getFormaPagamento());
        contaReceber.setStatus(StatusContaReceber.ABERTO);
        contaReceber.setValorRecebido(BigDecimal.ZERO);

        // TODO - testar

        return contaReceber;
    }
}
