package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ConvenioRequest;
import br.com.nemeia.brigia.dto.response.ConvenioResponse;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Convenio;
import java.util.List;

import br.com.nemeia.brigia.model.Paciente;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
public class ConvenioMapper {

  public ConvenioResponse toResponse(Convenio convenio) {
    if (convenio == null) {
      return null;
    }

    return new ConvenioResponse(
        convenio.getId(), convenio.getNome(), convenio.getDescricao(), convenio.getCriadoEm());
  }

  public List<ConvenioResponse> toResponseList(List<Convenio> patients) {
    return patients.stream().map(this::toResponse).toList();
  }

  public PagedResponse<ConvenioResponse> toPagedResponse(Page<Convenio> paged) {
    List<ConvenioResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
            responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }

  public Convenio toEntity(ConvenioRequest request) {
    Convenio convenio = new Convenio();
    convenio.setNome(request.nome());
    convenio.setDescricao(request.descricao());
    return convenio;
  }
}
