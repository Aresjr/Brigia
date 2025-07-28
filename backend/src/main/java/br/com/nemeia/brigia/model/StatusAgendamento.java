package br.com.nemeia.brigia.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusAgendamento {
  AGENDADO(0, "Agendado"),
  CONFIRMADO(1, "Confirmado"),
  CANCELADO(2, "Cancelado"),
  REALIZADO(3, "Realizado"),
  NAO_COMPARECEU(4, "Não Compareceu"),
  PENDENTE(5, "Pendente"),
  REAGENDADO(6, "Reagendado"),
  FINALIZADO(7, "Finalizado");

  private final Integer codigo;
  private final String descricao;
}
