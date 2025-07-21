package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.model.Paciente;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PatientMapper {

    public PatientResponse toResponse(Paciente paciente) {
        if (paciente == null) {
            return null;
        }

        return new PatientResponse(
            paciente.getId(),
            paciente.getEmail(),
            paciente.getCriadoEm(),
            paciente.getCpf(),
            paciente.getDataNascimento(),
            paciente.getSexo(),
            paciente.getCelular(),
            paciente.getUltimaConsulta(),
            paciente.getProximaConsulta(),
            paciente.getExcluido(),
            paciente.getUrlImagem(),
            paciente.getCorIdentificacao(),
            paciente.getCep(),
            paciente.getRua(),
            paciente.getComplemento(),
            paciente.getBairro(),
            paciente.getCidade(),
            paciente.getUf(),
            paciente.getConvenio()
        );
    }

    public List<PatientResponse> toResponseList(List<Paciente> pacientes) {
        return pacientes.stream()
                .map(this::toResponse)
                .toList();
    }
}
