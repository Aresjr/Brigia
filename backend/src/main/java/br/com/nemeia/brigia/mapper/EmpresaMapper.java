package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.dto.response.EmpresaResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Empresa;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
public class EmpresaMapper {

  public EmpresaResponse toResponse(Empresa empresa) {
    if (empresa == null) {
      return null;
    }

    return new EmpresaResponse(
        empresa.getId(),
        empresa.getNome(),
        empresa.getDescricao(),
        empresa.getCriadoEm(),
        empresa.getExcluido());
  }

  public PagedResponse<EmpresaResponse> toPagedResponse(Page<Empresa> paged) {
    List<EmpresaResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
        responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }

  public Empresa toEntity(EmpresaRequest request) {
    return new Empresa(request.nome(), request.descricao());
  }
}
