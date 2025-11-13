package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.TipoAgendamento;
import java.time.LocalDateTime;
import java.util.List;

public record ProcedimentoResponse(Long id, String nome, String codigo, String observacoes, Integer duracao,
        TipoAgendamento tipo, EspecialidadeResponse especialidade, LocalDateTime criadoEm, Boolean excluido) {
}
