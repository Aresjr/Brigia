package br.com.nemeia.brigia.dto.request;

import java.time.LocalTime;

public record AgendaSemanalRequest(
        Long profissionalId,
        Integer diaSemana,
        LocalTime horaInicial,
        LocalTime horaFinal
) {
}
