package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;

import java.math.BigDecimal;

public record ProcedimentoRequest(
    @NotBlank(message = "Nome é obrigatório")
    String nome,
    String codigo,
    String observacoes,
    BigDecimal valorPadrao,
    Long especialidadeId) {}
