package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.ContaReceber;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ContaReceberMapper {

    private final PacienteMapper pacienteMapper;
    private final EmpresaMapper empresaMapper;
    private final AtendimentoMapper atendimentoMapper;
    private final ProfissionalMapper profissionalMapper;
    private final ContaReceberItemMapper contaReceberItemMapper;

    public ContaReceberResponse toResponse(ContaReceber contaReceber) {
        if (contaReceber == null) {
            return null;
        }

        return new ContaReceberResponse(contaReceber.getId(), pacienteMapper.toResponse(contaReceber.getPaciente()),
                empresaMapper.toResponse(contaReceber.getEmpresa()),
                atendimentoMapper.toResponse(contaReceber.getAtendimento()),
                profissionalMapper.toResponse(contaReceber.getProfissional()), contaReceber.getValorTotal(),
                contaReceber.getValorRecebido(), contaReceber.getFormaPagamento(), contaReceber.getStatus(),
                contaReceber.getItens().stream().map(contaReceberItemMapper::toResponse).toList());
    }

    public PagedResponse<ContaReceberResponse> toPagedResponse(Page<ContaReceber> paged) {
        List<ContaReceberResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }
}
