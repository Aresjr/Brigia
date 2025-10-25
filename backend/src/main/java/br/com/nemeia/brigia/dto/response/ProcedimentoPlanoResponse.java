package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;

public record ProcedimentoPlanoResponse(Long id, EmpresaPlanoResponse plano, UnidadeResponse unidade, BigDecimal preco,
        BigDecimal repasse) {
}
