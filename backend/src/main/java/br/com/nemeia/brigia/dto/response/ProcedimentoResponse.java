package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.TipoAgendamento;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public record ProcedimentoResponse(Long id, String nome, String codigo, String observacoes, BigDecimal valorPadrao,
        BigDecimal valorRepasse, Integer duracao, TipoAgendamento tipo, EspecialidadeResponse especialidade,
        LocalDateTime criadoEm, List<PrecoProcedimentoResponse> precosProcedimento, Boolean excluido) {
}
