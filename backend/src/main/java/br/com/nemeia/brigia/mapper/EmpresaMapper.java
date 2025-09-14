package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.dto.response.EmpresaResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Empresa;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@Component
public class EmpresaMapper {

    private final ObjectMapper objectMapper;

    public EmpresaResponse toResponse(Empresa empresa) {
        if (empresa == null) {
            return null;
        }

        return objectMapper.convertValue(empresa, EmpresaResponse.class);
    }

    public PagedResponse<EmpresaResponse> toPagedResponse(Page<Empresa> paged) {
        List<EmpresaResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public Empresa toEntity(EmpresaRequest request) {
        return objectMapper.convertValue(request, Empresa.class);
    }
}
