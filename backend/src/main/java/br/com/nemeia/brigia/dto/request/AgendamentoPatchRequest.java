package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.StatusAgendamento;
import jakarta.validation.constraints.NotNull;

public record AgendamentoPatchRequest(
  @NotNull(message = "Status é obrigatório")
  StatusAgendamento status) {
}
