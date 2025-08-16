package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record ProcedimentoResponse(
    Long id,
    String nome,
    String codigo,
    BigDecimal valorPadrao,
    EspecialidadeResponse especialidade,
    String observacoes,
    LocalDateTime criadoEm,
    Boolean excluido) {}
