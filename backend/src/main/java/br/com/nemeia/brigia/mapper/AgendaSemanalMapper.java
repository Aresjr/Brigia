package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.AgendaSemanalRequest;
import br.com.nemeia.brigia.dto.response.AgendaSemanalResponse;
import br.com.nemeia.brigia.model.AgendaSemanal;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class AgendaSemanalMapper extends BaseMapper<AgendaSemanal, AgendaSemanalRequest, AgendaSemanalResponse> {

    private final ProfissionalMapper profissionalMapper;

    public AgendaSemanalMapper(ObjectMapper objectMapper, ProfissionalMapper profissionalMapper) {
        super(objectMapper, AgendaSemanal.class, AgendaSemanalResponse.class);
        this.profissionalMapper = profissionalMapper;
    }

    @Override
    public AgendaSemanalResponse toResponse(AgendaSemanal agendaSemanal) {
        if (agendaSemanal == null) {
            return null;
        }

        return new AgendaSemanalResponse(agendaSemanal.getId(),
                profissionalMapper.toResponse(agendaSemanal.getProfissional()), agendaSemanal.getDiaSemana(),
                agendaSemanal.getHoraInicial(), agendaSemanal.getHoraFinal(), agendaSemanal.getValorAdicional(),
                agendaSemanal.getIntervalo(), agendaSemanal.getCriadoEm(), agendaSemanal.getExcluido());
    }

    public AgendaSemanal updateEntity(AgendaSemanal original, AgendaSemanalRequest request) {
        original.setDiaSemana(request.diaSemana());
        original.setHoraInicial(request.horaInicial());
        original.setHoraFinal(request.horaFinal());
        original.setValorAdicional(request.valorAdicional());
        original.setIntervalo(request.intervalo());
        return original;
    }
}
