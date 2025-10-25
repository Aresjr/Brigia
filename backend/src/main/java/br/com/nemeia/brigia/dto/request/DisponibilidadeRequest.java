package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public record DisponibilidadeRequest(@NotNull(message = "ID do profissional é obrigatório") Long profissionalId,
        @NotNull(message = "Dia é obrigatório") LocalDate dia,
        @NotNull(message = "Hora inicial é obrigatória") LocalTime horaInicial,
        @NotNull(message = "Hora final é obrigatória") LocalTime horaFinal, BigDecimal valorAdicional) {
}
