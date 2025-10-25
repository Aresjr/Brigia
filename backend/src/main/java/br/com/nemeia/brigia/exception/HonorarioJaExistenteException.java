package br.com.nemeia.brigia.exception;

public class HonorarioJaExistenteException extends RuntimeException {
    public HonorarioJaExistenteException() {
        super("Já existe um honorário cadastrado para este profissional nesta data");
    }
}
