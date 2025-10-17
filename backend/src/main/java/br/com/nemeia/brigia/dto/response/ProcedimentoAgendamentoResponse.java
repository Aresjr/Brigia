package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;

public record ProcedimentoAgendamentoResponse(Long id, ProcedimentoResponse procedimento, Integer quantidade,
        BigDecimal valor, BigDecimal valorRepasse) {
}
