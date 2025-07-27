package br.com.nemeia.brigia.exception;

public class LoginServiceUnavailableException extends RuntimeException {
    public LoginServiceUnavailableException(String message) {
        super(message);
    }
}
