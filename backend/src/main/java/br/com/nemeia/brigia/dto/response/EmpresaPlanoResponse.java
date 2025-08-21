package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;

public record EmpresaPlanoResponse(
    Long id, String nome, String descricao, String corFundo, LocalDateTime criadoEm, Boolean excluido) {}
