package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.FilaEsperaRequest;
import br.com.nemeia.brigia.dto.response.FilaEsperaResponse;
import br.com.nemeia.brigia.model.FilaEspera;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class FilaEsperaMapper extends BaseMapper<FilaEspera, FilaEsperaRequest, FilaEsperaResponse> {

    private final PacienteMapper pacienteMapper;
    private final EspecialidadeMapper especialidadeMapper;

    public FilaEsperaMapper(ObjectMapper objectMapper, PacienteMapper pacienteMapper, EspecialidadeMapper especialidadeMapper) {
        super(objectMapper, FilaEspera.class, FilaEsperaResponse.class);
        this.pacienteMapper = pacienteMapper;
        this.especialidadeMapper = especialidadeMapper;
    }

    public FilaEsperaResponse toResponse(FilaEspera filaEspera) {
        if (filaEspera == null) {
            return null;
        }

        return new FilaEsperaResponse(
                filaEspera.getId(),
                pacienteMapper.toResponse(filaEspera.getPaciente()),
                especialidadeMapper.toResponse(filaEspera.getEspecialidade()),
                filaEspera.getObservacoes(),
                filaEspera.getCriadoEm(),
                filaEspera.getExcluido()
        );
    }
}
