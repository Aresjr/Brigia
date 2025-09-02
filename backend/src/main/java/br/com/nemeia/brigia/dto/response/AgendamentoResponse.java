package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusAgendamento;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record AgendamentoResponse(
        Long id,
        PacienteResponse paciente,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate data,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime hora,
        UnidadeResponse unidade,
        EspecialidadeResponse especialidade,
        EmpresaResponse empresa,
        ConvenioResponse convenio,
        ProfissionalResponse profissional,
        ProcedimentoResponse procedimento,
        StatusAgendamento status,
        FormaPagamento formaPagamento,
        BigDecimal valor,
        BigDecimal desconto,
        String observacoes,
        Integer duracao,
        LocalDateTime criadoEm,
        Boolean excluido) {}
