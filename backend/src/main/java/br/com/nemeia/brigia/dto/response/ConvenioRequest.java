package br.com.nemeia.brigia.dto.response;

import jakarta.validation.constraints.NotBlank;

public record ConvenioRequest(
    @NotBlank(message = "Nome é obrigatório")
    String nome,
    String descricao) {}
