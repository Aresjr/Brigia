package br.com.nemeia.brigia.exception;

public class ValorRecebidoUltrapassadoException extends RuntimeException {
    public ValorRecebidoUltrapassadoException() {
        super("Valor recebido ultrapassa o valor total");
    }
}
