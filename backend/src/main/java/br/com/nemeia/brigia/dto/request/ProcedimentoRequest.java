package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.util.List;

public record ProcedimentoRequest(
        @NotBlank(message = "Nome é obrigatório") String nome,
        String codigo,
        String observacoes,
        BigDecimal valorPadrao,
        @NotNull(message = "Especialidade é obrigatória")
        Long especialidadeId,
        List<PrecoProcedimentoRequest> precosConvenios) {}
