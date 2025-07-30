package br.com.nemeia.brigia.exception;

public class InvalidCredentialsException extends RuntimeException {
  public InvalidCredentialsException(String message) {
    super(message);
  }

  public InvalidCredentialsException() {
    super("Usuário ou senha inválidos");
  }
}
