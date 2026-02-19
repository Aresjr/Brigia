package br.com.nemeia.brigia.dto.request;

import java.math.BigDecimal;

public record RepasseProfissionalRequest(Long unidadeId, Long convenioId, Long procedimentoId, BigDecimal valor) {
}

