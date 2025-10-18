package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.dto.response.EmpresaPlanoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.EmpresaPlano;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@Component
public class EmpresaPlanoMapper {

    private final ObjectMapper objectMapper;

    public EmpresaPlanoResponse toResponse(EmpresaPlano plano) {
        if (plano == null) {
            return null;
        }

        return new EmpresaPlanoResponse(
            plano.getId(),
            plano.getNome(),
            plano.getDescricao(),
            plano.getCorFundo()
        );
    }

    public PagedResponse<EmpresaPlanoResponse> toPagedResponse(Page<EmpresaPlano> paged) {
        List<EmpresaPlanoResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public EmpresaPlano toEntity(EmpresaRequest request) {
        return objectMapper.convertValue(request, EmpresaPlano.class);
    }
}
