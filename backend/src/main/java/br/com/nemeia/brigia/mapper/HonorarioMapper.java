package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.HonorarioResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Honorario;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@AllArgsConstructor
public class HonorarioMapper {

    private final ProfissionalMapper profissionalMapper;
    private final UnidadeMapper unidadeMapper;

    public HonorarioResponse toResponse(Honorario honorario) {
        if (honorario == null) {
            return null;
        }

        return new HonorarioResponse(honorario.getId(), profissionalMapper.toResponse(honorario.getProfissional()),
                honorario.getData(), honorario.getValorTotal(), honorario.getQuantidadeAtendimentos(),
                honorario.getValorAdicional(), honorario.getValorHora(),
                unidadeMapper.toResponse(honorario.getUnidade()), honorario.getCriadoEm(), honorario.getExcluido());
    }

    public PagedResponse<HonorarioResponse> toPagedResponse(Page<Honorario> paged) {
        List<HonorarioResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }
}
