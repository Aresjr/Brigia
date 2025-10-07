package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record ProcedimentoAgendamentoRequest(
        @NotNull(message = "Procedimento é obrigatório") Long procedimentoId,
        @NotNull(message = "Quantidade é obrigatória") @Min(value = 1, message = "Quantidade deve ser no mínimo 1") Integer quantidade) {
}
