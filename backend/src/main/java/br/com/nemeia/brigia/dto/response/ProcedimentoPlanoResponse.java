package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;

public record ProcedimentoPlanoResponse(Long id, EmpresaPlanoResponse plano, BigDecimal preco, BigDecimal repasse) {
}
