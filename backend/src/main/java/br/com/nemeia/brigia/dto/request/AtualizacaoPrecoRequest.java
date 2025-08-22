package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

public record AtualizacaoPrecoRequest(
        @NotNull(message = "Id é obrigatório") Long id,
        @NotNull(message = "Preço é obrigatório") BigDecimal preco) {}
