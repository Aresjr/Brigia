package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;

public record PrecoEmpresaResponse(BigDecimal preco, BigDecimal repasse, EmpresaResponse empresa) {
}
