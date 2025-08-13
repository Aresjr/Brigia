package br.com.nemeia.brigia.dto.response;

import java.util.List;

public record TabelaPrecoResponse(
    ProcedimentoResponse procedimento,
    List<PrecoProcedimentoResponse> tabelaConvenio,
    List<PrecoProcedimentoResponse> tabelaEmpresa
) {}
