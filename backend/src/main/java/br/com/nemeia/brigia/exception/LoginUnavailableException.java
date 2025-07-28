package br.com.nemeia.brigia.exception;

public class LoginUnavailableException extends RuntimeException {
    public LoginUnavailableException(String message) {
        super(message);
    }
}
