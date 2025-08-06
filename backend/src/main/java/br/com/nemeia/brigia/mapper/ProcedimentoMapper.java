package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.ProcedimentoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Procedimento;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ProcedimentoMapper {

  public ProcedimentoResponse toResponse(Procedimento procedimento) {
    if (procedimento == null) {
      return null;
    }

    return new ProcedimentoResponse(
        procedimento.getId(), procedimento.getNome(), procedimento.getCodigo(),
        procedimento.getObservacoes(), procedimento.getCriadoEm(), procedimento.getExcluido());
  }

  public PagedResponse<ProcedimentoResponse> toPagedResponse(Page<Procedimento> paged) {
    List<ProcedimentoResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
            responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }

  public Procedimento toEntity(ProcedimentoRequest request) {
    return new Procedimento(request.codigo(), request.nome(), request.observacoes());
  }
}
