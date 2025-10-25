package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record AgendaSemanalResponse(Long id, ProfissionalResponse profissional, Integer diaSemana,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaInicial,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaFinal, BigDecimal valorAdicional,
        LocalDateTime criadoEm, Boolean excluido) {
}
