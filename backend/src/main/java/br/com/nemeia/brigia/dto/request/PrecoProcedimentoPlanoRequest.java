package br.com.nemeia.brigia.dto.request;

import java.math.BigDecimal;

public record PrecoProcedimentoPlanoRequest(Long planoId, BigDecimal preco, BigDecimal repasse) {
}
