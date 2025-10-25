package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;

public record FilaEsperaResponse(
        Long id,
        PacienteResponse paciente,
        EspecialidadeResponse especialidade,
        String observacoes,
        LocalDateTime criadoEm,
        Boolean excluido
) {
}
