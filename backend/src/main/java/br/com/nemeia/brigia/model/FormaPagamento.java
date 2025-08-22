package br.com.nemeia.brigia.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum FormaPagamento {
    DINHEIRO(0, "Dinheiro"),
    CARTAO_CREDITO(1, "Cartão de Crédito"),
    CARTAO_DEBITO(2, "Cartão de Débito"),
    PIX(3, "Pix");

    private final Integer codigo;
    private final String descricao;
}
