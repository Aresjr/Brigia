package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;
import java.math.BigDecimal;

public record PrecoProcedimentoRequest(
        @NotBlank(message = "Convênio é obrigatório") Long convenioId,
        @NotBlank(message = "Preço é obrigatório") BigDecimal preco,
        BigDecimal repasse) {}
