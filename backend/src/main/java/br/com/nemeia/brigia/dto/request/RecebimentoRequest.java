package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record RecebimentoRequest(@NotNull(message = "Valor Recebido é obrigatório") BigDecimal valorRecebido) {
}
