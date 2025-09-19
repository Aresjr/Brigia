package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;
import java.time.LocalTime;
import java.util.List;

public record AtendimentoRequest(Long id, @NotNull(message = "Agendamento é obrigatório") Long agendamentoId,
        LocalTime horaInicio, String anamnese, String diagnostico, String evolucaoClinica, String exameFisico,
        String examesSolicitados, List<ProcedimentoAtendimentoRequest> procedimentos, String observacoes) {
}
