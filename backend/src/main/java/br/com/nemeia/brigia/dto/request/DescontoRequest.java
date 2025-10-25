package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

import java.math.BigDecimal;

public record DescontoRequest(
        @NotNull(message = "Desconto é obrigatório") @PositiveOrZero(message = "Desconto deve ser maior ou igual a zero") BigDecimal desconto) {
}
