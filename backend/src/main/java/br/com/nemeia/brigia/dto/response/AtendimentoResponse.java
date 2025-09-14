package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.time.LocalTime;

public record AtendimentoResponse(Long id, PacienteResponse paciente, ProfissionalResponse profissional,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate data,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaInicio,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaFim,
        AgendamentoResponse agendamento, ConvenioResponse convenio,
        EmpresaResponse empresa, EspecialidadeResponse especialidade, FormaPagamento formaPagamento,
        String observacoes, String anamnese, String exameFisico, String diagnostico, String evolucaoClinica,
        String examesSolicitados, String prescricoes) {
}
