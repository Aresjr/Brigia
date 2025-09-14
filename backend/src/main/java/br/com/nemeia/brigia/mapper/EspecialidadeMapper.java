package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.EspecialidadeRequest;
import br.com.nemeia.brigia.dto.response.EspecialidadeResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Especialidade;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
public class EspecialidadeMapper {

    public EspecialidadeResponse toResponse(Especialidade especialidade) {
        if (especialidade == null) {
            return null;
        }

        return new EspecialidadeResponse(especialidade.getId(), especialidade.getNome(), especialidade.getDescricao(),
                especialidade.getCriadoEm(), especialidade.getExcluido());
    }

    public PagedResponse<EspecialidadeResponse> toPagedResponse(Page<Especialidade> paged) {
        List<EspecialidadeResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public Especialidade toEntity(EspecialidadeRequest request) {
        return new Especialidade(request.nome(), request.descricao());
    }
}
