package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum StatusContaReceber {
    ABERTO(0, "Aberto"), PAGO(1, "Pago"), ATRASADO(2, "Atrasado"), PARCIAL(3, "Parcial");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
