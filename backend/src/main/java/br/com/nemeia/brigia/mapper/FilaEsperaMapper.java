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
    private final ConvenioMapper convenioMapper;
    private final EmpresaMapper empresaMapper;
    private final ProfissionalMapper profissionalMapper;
    private final ProcedimentoMapper procedimentoMapper;

    public FilaEsperaMapper(ObjectMapper objectMapper, PacienteMapper pacienteMapper,
            EspecialidadeMapper especialidadeMapper, ConvenioMapper convenioMapper, EmpresaMapper empresaMapper,
            ProfissionalMapper profissionalMapper, ProcedimentoMapper procedimentoMapper) {
        super(objectMapper, FilaEspera.class, FilaEsperaResponse.class);
        this.pacienteMapper = pacienteMapper;
        this.especialidadeMapper = especialidadeMapper;
        this.convenioMapper = convenioMapper;
        this.empresaMapper = empresaMapper;
        this.profissionalMapper = profissionalMapper;
        this.procedimentoMapper = procedimentoMapper;
    }

    public FilaEsperaResponse toResponse(FilaEspera filaEspera) {
        if (filaEspera == null) {
            return null;
        }

        return new FilaEsperaResponse(filaEspera.getId(), pacienteMapper.toResponse(filaEspera.getPaciente()),
                especialidadeMapper.toResponse(filaEspera.getEspecialidade()), filaEspera.getObservacoes(),
                convenioMapper.toResponse(filaEspera.getConvenio()), empresaMapper.toResponse(filaEspera.getEmpresa()),
                profissionalMapper.toResponse(filaEspera.getProfissional()),
                procedimentoMapper.toResponse(filaEspera.getProcedimento()), filaEspera.getTipoAgendamento(),
                filaEspera.getFormaPagamento(), filaEspera.getValor(), filaEspera.getDesconto(),
                filaEspera.getDuracao(), filaEspera.getCriadoEm(), filaEspera.getExcluido());
    }
}
