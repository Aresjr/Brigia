package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusAtendimento {
    AGENDADO(0, "Em andamento"),
    CONFIRMADO(1, "Concluído"),
    CANCELADO(2, "Faturado"),
    NAO_COMPARECEU(3, "Não compareceu");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
