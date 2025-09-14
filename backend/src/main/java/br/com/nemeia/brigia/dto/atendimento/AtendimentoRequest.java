package br.com.nemeia.brigia.dto.atendimento;

import jakarta.validation.constraints.NotNull;
import java.time.LocalTime;
import java.util.List;

public record AtendimentoRequest(@NotNull(message = "Agendamento é obrigatório") Long agendamentoId,
        LocalTime horaInicio, String anamnese, String diagnostico, String evolucaoClinica, String exameFisico,
        String examesSolicitados, List<ProcedimentoAtendimentoRequest> procedimentos, String observacoes) {
}
