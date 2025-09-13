package br.com.nemeia.brigia.dto.atendimento;

import java.util.List;

public record AtendimentoRequest(
        Long agendamentoId,
        String anamnese,
        String diagnostico,
        String evolucaoClinica,
        String exameFisico,
        String examesSolicitados,
        List<ProcedimentoAtendimentoRequest> procedimentos,
        String observacoes) {}
