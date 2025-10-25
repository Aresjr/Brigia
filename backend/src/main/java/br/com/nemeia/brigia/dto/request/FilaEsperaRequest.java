package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;

public record FilaEsperaRequest(
        @NotNull(message = "Paciente é obrigatório") Long pacienteId,
        @NotNull(message = "Especialidade é obrigatória") Long especialidadeId,
        String observacoes
) {
}
