package br.com.nemeia.brigia.dto.request;

import java.time.LocalTime;
import java.util.List;

public record AtendimentoRequest(Long id, Long agendamentoId, LocalTime horaInicio, String anamnese, String diagnostico,
        String evolucaoClinica, String exameFisico, String examesSolicitados, String prescricoes,
        List<ProcedimentoAtendimentoRequest> procedimentos, String observacoes) {
}
