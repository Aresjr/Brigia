package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Paciente;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class PacienteMapper {

    private final ObjectMapper objectMapper;
    private final ConvenioMapper convenioMapper;
    private final EmpresaMapper empresaMapper;

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
                empresaMapper.toResponse(paciente.getEmpresa()),
                paciente.getCriadoEm(),
                paciente.getExcluido());
    }

    public Paciente toEntity(PacienteRequest request) {
        if (request == null) {
            return null;
        }
        return objectMapper.convertValue(request, Paciente.class);
    }

    public PagedResponse<PacienteResponse> toPagedResponse(Page<Paciente> paged) {
        List<PacienteResponse> responses =
                paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(
                responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }
}
