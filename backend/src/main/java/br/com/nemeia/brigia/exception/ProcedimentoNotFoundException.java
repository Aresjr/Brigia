package br.com.nemeia.brigia.exception;

public class ProcedimentoNotFoundException extends RuntimeException {
  public ProcedimentoNotFoundException(String message) {
    super(message);
  }
}
