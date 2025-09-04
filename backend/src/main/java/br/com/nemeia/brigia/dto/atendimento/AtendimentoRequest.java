package br.com.nemeia.brigia.dto.atendimento;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusAtendimento;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record AtendimentoRequest(
        @NotNull(message = "O paciente é obrigatório") Long pacienteId,
        @NotNull(message = "A data é obrigatória") LocalDateTime data,
        @NotNull(message = "A hora de início é obrigatória") LocalTime horaInicio,
        @NotNull(message = "A hora de fim é obrigatória") LocalTime horaFim,
        Long unidadeId,
        Long agendamentoId,
        Long convenioId,
        Long empresaId,
        Long especialidadeId,
        @NotNull(message = "O status é obrigatório") StatusAtendimento status,
        FormaPagamento formaPagamento,
        String observacoes) {}
