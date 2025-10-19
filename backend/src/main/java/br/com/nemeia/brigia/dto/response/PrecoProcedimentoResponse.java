package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public record PrecoProcedimentoResponse(Long id, BigDecimal preco, BigDecimal repasse,
        @JsonInclude(JsonInclude.Include.NON_NULL) ConvenioResponse convenio,
        @JsonInclude(JsonInclude.Include.NON_NULL) UnidadeResponse unidade, LocalDateTime criadoEm, String criadoPor,
        LocalDateTime atualizadoEm, String atualizadoPor) {
}
