package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.RepasseRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.RepasseResponse;
import br.com.nemeia.brigia.model.Repasse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@AllArgsConstructor
public class RepasseMapper {

    private final ProcedimentoMapper procedimentoMapper;
    private final UnidadeMapper unidadeMapper;
    private final ConvenioMapper convenioMapper;
    private final ProfissionalMapper profissionalMapper;

    public RepasseResponse toResponse(Repasse repasse) {
        if (repasse == null) {
            return null;
        }

        return new RepasseResponse(
                repasse.getId(),
                procedimentoMapper.toResponse(repasse.getProcedimento()),
                unidadeMapper.toResponse(repasse.getUnidade()),
                convenioMapper.toResponse(repasse.getConvenio()),
                profissionalMapper.toResponse(repasse.getProfissional()),
                repasse.getValor(),
                repasse.getPercentual(),
                repasse.getObservacoes(),
                repasse.getCriadoEm(),
                repasse.getCriadoPor() != null ? repasse.getCriadoPor().toString() : null,
                repasse.getAtualizadoEm(),
                repasse.getAtualizadoPor() != null ? repasse.getAtualizadoPor().toString() : null,
                repasse.getExcluido()
        );
    }

    public PagedResponse<RepasseResponse> toPagedResponse(Page<Repasse> paged) {
        List<RepasseResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }
}

