package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusAgendamento;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record AgendamentoResponse(
        Long id, PacienteResponse pacienteResponse,
        LocalDate dia, LocalTime hora,
        UnidadeResponse unidade, EspecialidadeResponse especialidade,
        ProfissionalResponse profissional, ProcedimentoResponse procedimento,
        StatusAgendamento status, FormaPagamento formaPagamento,
        BigDecimal valor, BigDecimal desconto,
        Integer duracao, LocalDateTime criadoEm, Boolean excluido) {}
