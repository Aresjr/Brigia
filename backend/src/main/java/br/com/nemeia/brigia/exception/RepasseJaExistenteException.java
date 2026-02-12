package br.com.nemeia.brigia.exception;

public class RepasseJaExistenteException extends RuntimeException {
    public RepasseJaExistenteException() {
        super("Já existe um repasse cadastrado para esta combinação de Procedimento, Unidade, Convênio e Profissional");
    }
}

