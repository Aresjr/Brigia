package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;

public record EmpresaResponse(
    Long id, String nome, String descricao, LocalDateTime criadoEm, Boolean excluido) {}
