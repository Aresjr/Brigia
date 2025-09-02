package br.com.nemeia.brigia.model;

import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum TipoAgendamento {
    CONSULTA(0, "Consulta"),
    EXAME(1, "Exame"),
    ASO(2, "ASO"),
    PROCEDIMENTO(3, "Procedimento"),
    SESSAO(4, "Sessão"),
    RETORNO(5, "Retorno");

    private final Integer codigo;
    private final String descricao;

    @JsonValue
    public int getCodigo() {
        return codigo;
    }
}
