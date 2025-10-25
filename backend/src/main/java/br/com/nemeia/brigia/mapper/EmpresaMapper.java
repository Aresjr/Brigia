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
    private final EmpresaPlanoMapper empresaPlanoMapper;

    public EmpresaResponse toResponse(Empresa empresa) {
        if (empresa == null) {
            return null;
        }

        return new EmpresaResponse(empresa.getId(), empresa.getNome(), empresa.getObservacao(), empresa.getCodigoBc(),
                empresa.getValorMinimoMensal(), empresa.getMinimoPorFuncionario(), empresa.getValorMes(),
                empresa.getFunc(), empresa.getCnpj(), empresa.getEmail(),
                empresaPlanoMapper.toResponse(empresa.getPlano()), empresa.getCriadoEm(), empresa.getExcluido());
    }

    public PagedResponse<EmpresaResponse> toPagedResponse(Page<Empresa> paged) {
        List<EmpresaResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public Empresa toEntity(EmpresaRequest request) {
        return objectMapper.convertValue(request, Empresa.class);
    }
}
