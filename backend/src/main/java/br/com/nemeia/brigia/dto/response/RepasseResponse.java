package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record RepasseResponse(
        Long id,
        ProcedimentoResponse procedimento,
        UnidadeResponse unidade,
        ConvenioResponse convenio,
        ProfissionalResponse profissional,
        BigDecimal valor,
        BigDecimal percentual,
        String observacoes,
        LocalDateTime criadoEm,
        String criadoPor,
        LocalDateTime atualizadoEm,
        String atualizadoPor,
        Boolean excluido) {
}

