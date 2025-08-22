package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;
import java.math.BigDecimal;

public record EmpresaRequest(
        @NotBlank(message = "Nome é obrigatório") String nome,
        String observacao,
        String codigoBc,
        BigDecimal valorMinimoMensal,
        BigDecimal minimoPorFuncionario,
        BigDecimal valorMes,
        Long func) {}
