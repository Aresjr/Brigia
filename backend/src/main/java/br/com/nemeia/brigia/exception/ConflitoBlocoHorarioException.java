package br.com.nemeia.brigia.exception;

public class ConflitoBlocoHorarioException extends RuntimeException {
    public ConflitoBlocoHorarioException() {
        super("Já existe uma disponibilidade cadastrada neste bloco de horário para o profissional");
    }
}
