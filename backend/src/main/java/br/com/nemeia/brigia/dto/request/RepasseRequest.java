package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import java.math.BigDecimal;

public record RepasseRequest(
        @NotNull(message = "O ID do procedimento é obrigatório") Long procedimentoId,
        @NotNull(message = "O ID da unidade é obrigatório") Long unidadeId,
        @NotNull(message = "O ID do convênio é obrigatório") Long convenioId,
        @NotNull(message = "O ID do profissional é obrigatório") Long profissionalId,
        @NotNull(message = "O valor do repasse é obrigatório") @Positive(message = "O valor deve ser positivo") BigDecimal valor,
        BigDecimal percentual,
        String observacoes) {
}

