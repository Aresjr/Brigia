package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.FormaPagamento;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public record AgendamentoRequest(
        @NotNull(message = "Paciente é obrigatório")
        Long pacienteId,
        @NotNull(message = "Data é obrigatória")
        LocalDate data,
        @NotNull(message = "Hora é obrigatória")
        LocalTime hora,
        @NotNull(message = "Especialidade é obrigatória")
        Long especialidadeId,
        @NotNull(message = "Profissional é obrigatório")
        Long profissionalId,
        Long procedimentoId,
        Long empresaId,
        Long convenioId,
        FormaPagamento formaPagamento,
        BigDecimal valor,
        BigDecimal desconto,
        @NotNull(message = "Duração é obrigatória")
        Integer duracao,
        String observacoes) {}
