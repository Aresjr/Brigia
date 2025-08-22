package br.com.nemeia.brigia.dto.response;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record EmpresaResponse(
        Long id,
        String nome,
        String observacao,
        String codigoBc,
        BigDecimal valorMinimoMensal,
        BigDecimal minimoPorFuncionario,
        BigDecimal valorMes,
        Long func,
        UnidadeResponse unidade,
        EmpresaPlanoResponse plano,
        LocalDateTime criadoEm,
        Boolean excluido) {}
