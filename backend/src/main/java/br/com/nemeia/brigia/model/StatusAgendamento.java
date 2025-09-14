package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusAgendamento {
    AGENDADO(0, "Agendado"), CONFIRMADO(1, "Confirmado"), EM_ATENDIMENTO(2, "Em Atendimento"), CANCELADO(4,
            "Cancelado"), NAO_COMPARECEU(5, "Não Compareceu"), REAGENDADO(6, "Reagendado"), FINALIZADO(7, "Finalizado");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
