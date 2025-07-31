package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.PacienteRequest;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Paciente;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

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

  private String getDescricaoSexo(Character sexo) {
    if (sexo == null) {
      return null;
    }
    return sexo == 'M' ? "Masculino" : "Feminino";
  }

  public Paciente toEntity(PacienteRequest request) {
    if (request == null) {
      return null;
    }

    Paciente paciente = new Paciente();
    paciente.setNome(request.nome());
    paciente.setEmail(request.email());
    paciente.setCpf(request.cpf());
    paciente.setDataNascimento(request.dataNascimento());
    paciente.setSexo(request.sexo() != null ? request.sexo().charAt(0) : null);
    paciente.setCelular(request.celular());
    paciente.setUrlImagem(request.urlImagem());
    paciente.setCorIdentificacao(request.corIdentificacao());
    paciente.setCep(request.cep());
    paciente.setRua(request.rua());
    paciente.setComplemento(request.complemento());
    paciente.setBairro(request.bairro());
    paciente.setCidade(request.cidade());
    paciente.setUf(request.uf());
    return paciente;
  }

  public PagedResponse<PacienteResponse> toPagedResponse(Page<Paciente> paged) {
    List<PacienteResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
            responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }
}
