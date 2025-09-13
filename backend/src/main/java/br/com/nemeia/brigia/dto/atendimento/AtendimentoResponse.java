package br.com.nemeia.brigia.dto.atendimento;

import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.model.FormaPagamento;
import java.time.LocalDateTime;
import java.time.LocalTime;

public record AtendimentoResponse(
        Long id,
        PacienteResponse paciente,
        ProfissionalResponse profissional,
        LocalDateTime data,
        LocalTime horaInicio,
        LocalTime horaFim,
        AgendamentoResponse agendamento,
        ConvenioResponse convenio,
        EmpresaResponse empresa,
        EspecialidadeResponse especialidade,
        FormaPagamento formaPagamento,
        String observacoes) {}
