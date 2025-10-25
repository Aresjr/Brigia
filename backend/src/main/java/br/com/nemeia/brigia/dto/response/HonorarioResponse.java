package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public record HonorarioResponse(Long id, ProfissionalResponse profissional,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate data, BigDecimal valorTotal,
        Integer quantidadeAtendimentos, BigDecimal valorAdicional, UnidadeResponse unidade, LocalDateTime criadoEm,
        Boolean excluido) {
}
