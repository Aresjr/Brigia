package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.math.BigDecimal;

public record PrecoProcedimentoResponse(
        BigDecimal preco,
        BigDecimal repasse,
        @JsonInclude(JsonInclude.Include.NON_NULL)
        ConvenioResponse convenio,
        @JsonInclude(JsonInclude.Include.NON_NULL)
        EmpresaResponse empresa,
        @JsonInclude(JsonInclude.Include.NON_NULL)
        UnidadeResponse unidade) {}
