package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Paciente;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class PacienteMapper {

  private final ConvenioMapper convenioMapper;

  public PacienteResponse toResponse(Paciente paciente) {
    if (paciente == null) {
      return null;
    }

    return new PacienteResponse(
        paciente.getId(),
        paciente.getNome(),
        paciente.getEmail(),
        paciente.getCpf(),
        paciente.getDataNascimento(),
        paciente.getSexo(),
        paciente.getCelular(),
        paciente.getUltimaConsulta(),
        paciente.getProximaConsulta(),
        paciente.getUrlImagem(),
        paciente.getCorIdentificacao(),
        paciente.getCep(),
        paciente.getRua(),
        paciente.getComplemento(),
        paciente.getBairro(),
        paciente.getCidade(),
        paciente.getUf(),
        convenioMapper.toResponse(paciente.getConvenio()),
        paciente.getCriadoEm(),
        paciente.getExcluido());
  }

  public Paciente toEntity(PacienteRequest request) {
    if (request == null) {
      return null;
    }

    return new Paciente(
        request.nome(),
        request.email(),
        request.cpf(),
        request.dataNascimento(),
        request.sexo() != null ? request.sexo().charAt(0) : null,
        request.celular(),
        request.urlImagem(),
        request.corIdentificacao(),
        request.cep(),
        request.rua(),
        request.complemento(),
        request.bairro(),
        request.cidade(),
        request.uf());
  }

  public PagedResponse<PacienteResponse> toPagedResponse(Page<Paciente> paged) {
    List<PacienteResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
        responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }
}
