package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.model.Paciente;
import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class PacienteMapper {

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
        getDescricaoSexo(paciente.getSexo()),
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
        paciente.getConvenio() != null ? paciente.getConvenio().getId() : null,
        paciente.getCriadoEm());
  }

  public List<PacienteResponse> toResponseList(List<Paciente> pacientes) {
    return pacientes.stream().map(this::toResponse).toList();
  }

  private String getDescricaoSexo(Character sexo) {
    if (sexo == null) {
      return null;
    }
    return sexo == 'M' ? "Masculino" : "Feminino";
  }
}
