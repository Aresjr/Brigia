package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.PagedResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;

import java.util.List;

@RequiredArgsConstructor
public class BaseMapper<Ent, Req, Res> {

    private final ObjectMapper objectMapper;
    private final Class<Ent> entityClass;
    private final Class<Res> responseClass;

    public Res toResponse(Ent entity) {
        if (entity == null) {
            return null;
        }

        return objectMapper.convertValue(entity, responseClass);
    }

    public Ent toEntity(Req request) {
        if (request == null) {
            return null;
        }
        return objectMapper.convertValue(request, entityClass);
    }

    public PagedResponse<Res> toPagedResponse(Page<Ent> paged) {
        List<Res> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }
}
