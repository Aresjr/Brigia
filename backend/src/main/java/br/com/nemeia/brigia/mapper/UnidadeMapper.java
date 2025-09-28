package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.UnidadeResponse;
import br.com.nemeia.brigia.model.Unidade;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UnidadeMapper {

    private final ObjectMapper objectMapper;

    public UnidadeResponse toResponse(Unidade unidade) {
        if (unidade == null) {
            return null;
        }

        return objectMapper.convertValue(unidade, UnidadeResponse.class);
    }

    public PagedResponse<UnidadeResponse> toPagedResponse(Page<Unidade> paged) {
        List<UnidadeResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

}
