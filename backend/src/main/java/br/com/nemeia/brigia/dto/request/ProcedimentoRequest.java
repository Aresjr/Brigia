package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;

public record ProcedimentoRequest(
    @NotBlank(message = "Nome é obrigatório")
    String nome,
    String codigo,
    String observacoes,
    Long especialidadeId) {}
