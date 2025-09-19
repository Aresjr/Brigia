package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusAtendimento {
    EM_ATENDIMENTO(0, "Em Atendimento"), CANCELADO(1, "Confirmado"), FINALIZADO(2, "Finalizado");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
