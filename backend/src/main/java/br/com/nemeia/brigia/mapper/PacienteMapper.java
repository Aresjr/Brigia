package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.model.Paciente;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class PacienteMapper extends BaseMapper<Paciente, PacienteRequest, PacienteResponse> {

    private final ObjectMapper objectMapper;
    private final ConvenioMapper convenioMapper;
    private final EmpresaMapper empresaMapper;

    public PacienteMapper(ObjectMapper objectMapper, ConvenioMapper convenioMapper, EmpresaMapper empresaMapper) {
        super(objectMapper, Paciente.class, PacienteResponse.class);
        this.objectMapper = objectMapper;
        this.convenioMapper = convenioMapper;
        this.empresaMapper = empresaMapper;
    }

    public PacienteResponse toResponse(Paciente paciente) {
        if (paciente == null) {
            return null;
        }

        return new PacienteResponse(paciente.getId(), paciente.getNome(), paciente.getNomeSocial(),
                paciente.getPressaoArterial(), paciente.getEmail(), paciente.getCpf(), paciente.getDataNascimento(),
                paciente.getUltimaConsulta(), paciente.getProximaConsulta(), paciente.getUrlImagem(),
                paciente.getSexo(), paciente.getCelular(), paciente.getCelular2(), paciente.getFixo(),
                paciente.getDocumento(), paciente.getProfissao(), paciente.getPeso(), paciente.getAltura(),
                paciente.getCorIdentificacao(), paciente.getCep(), paciente.getRua(), paciente.getComplemento(),
                paciente.getBairro(), paciente.getCidade(), paciente.getUf(),
                convenioMapper.toResponse(paciente.getConvenio()),
                empresaMapper.toResponse(paciente.getEmpresa()), paciente.getCriadoEm(), paciente.getExcluido());
    }
}
