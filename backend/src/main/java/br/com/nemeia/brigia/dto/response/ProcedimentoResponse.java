package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;

public record ProcedimentoResponse(
        Long id,
        String nome,
        String codigo,
        String observacoes,
        LocalDateTime criadoEm,
        Boolean excluido) {}
