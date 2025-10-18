package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;
import java.time.LocalTime;

public record AgendaSemanalResponse(
        Long id,
        ProfissionalResponse profissional,
        Integer diaSemana,
        LocalTime horaInicial,
        LocalTime horaFinal,
        LocalDateTime criadoEm,
        Boolean excluido
) {
}
