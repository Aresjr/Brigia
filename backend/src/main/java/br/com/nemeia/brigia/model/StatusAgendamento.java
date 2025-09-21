package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusAgendamento {
    AGENDADO(0, "Agendado"), CONFIRMADO(1, "Confirmado"), EM_ATENDIMENTO(2, "Em Atendimento"), CANCELADO(3,
            "Cancelado"), NAO_COMPARECEU(4, "Não Compareceu"), REAGENDADO(5, "Reagendado"), FINALIZADO(6, "Finalizado"),
            CANCELADO_USUARIO(7, "Cancelado pelo Usuário");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
