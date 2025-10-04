package br.com.nemeia.brigia.dto.response;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record DisponibilidadeResponse(
        Long id,
        ProfissionalResponse profissional,
        LocalDate dia,
        LocalTime horaInicial,
        LocalTime horaFinal,
        LocalDateTime criadoEm,
        Boolean excluido) {
}
