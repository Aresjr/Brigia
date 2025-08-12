package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.dto.response.EspecialidadeResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.ProfissionalResponse;
import br.com.nemeia.brigia.model.Profissional;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class ProfissionalMapper {

  private final EspecialidadeMapper especialidadeMapper;

  public ProfissionalResponse toResponse(Profissional profissional) {
    if (profissional == null) {
      return null;
    }

    return new ProfissionalResponse(
        profissional.getId(),
        profissional.getNome(),
        profissional.getEmail(),
        profissional.getCpf(),
        profissional.getDataNascimento(),
        profissional.getSexo(),
        profissional.getCelular(),
        profissional.getUrlImagem(),
        profissional.getCrm(),
        getEspecialidades(profissional),
        profissional.getCriadoEm(),
        profissional.getExcluido());
  }

  public Profissional toEntity(ProfissionalRequest request) {
    if (request == null) {
      return null;
    }

    return new Profissional(
        request.nome(),
        request.email(),
        request.cpf(),
        request.dataNascimento(),
        request.sexo() != null ? request.sexo().charAt(0) : null,
        request.celular(),
        request.urlImagem(),
        request.crm());
  }

  public PagedResponse<ProfissionalResponse> toPagedResponse(Page<Profissional> paged) {
    List<ProfissionalResponse> responses =
        paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
        responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }

  private List<EspecialidadeResponse> getEspecialidades(Profissional profissional) {
    if (profissional.getEspecialidades() == null) {
      return List.of();
    }
    return profissional.getEspecialidades().stream().map(especialidadeMapper::toResponse).toList();
  }
}
