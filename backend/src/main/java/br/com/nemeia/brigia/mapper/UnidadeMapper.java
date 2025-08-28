package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.UnidadeResponse;
import br.com.nemeia.brigia.model.Unidade;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

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
}
