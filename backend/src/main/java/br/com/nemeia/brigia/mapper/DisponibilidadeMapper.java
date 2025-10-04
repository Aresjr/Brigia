package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.DisponibilidadeRequest;
import br.com.nemeia.brigia.dto.response.DisponibilidadeResponse;
import br.com.nemeia.brigia.model.Disponibilidade;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class DisponibilidadeMapper extends BaseMapper<Disponibilidade, DisponibilidadeRequest, DisponibilidadeResponse> {

    private final ProfissionalMapper profissionalMapper;

    public DisponibilidadeMapper(ObjectMapper objectMapper, ProfissionalMapper profissionalMapper) {
        super(objectMapper, Disponibilidade.class, DisponibilidadeResponse.class);
        this.profissionalMapper = profissionalMapper;
    }

    @Override
    public DisponibilidadeResponse toResponse(Disponibilidade disponibilidade) {
        if (disponibilidade == null) {
            return null;
        }

        return new DisponibilidadeResponse(
                disponibilidade.getId(),
                profissionalMapper.toResponse(disponibilidade.getProfissional()),
                disponibilidade.getDia(),
                disponibilidade.getHoraInicial(),
                disponibilidade.getHoraFinal(),
                disponibilidade.getCriadoEm(),
                disponibilidade.getExcluido());
    }

    public Disponibilidade updateEntity(Disponibilidade original, DisponibilidadeRequest request) {
        original.setDia(request.dia());
        original.setHoraInicial(request.horaInicial());
        original.setHoraFinal(request.horaFinal());
        return original;
    }
}
