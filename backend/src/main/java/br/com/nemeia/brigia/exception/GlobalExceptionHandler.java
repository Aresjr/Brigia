package br.com.nemeia.brigia.exception;

import br.com.nemeia.brigia.dto.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.Instant;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(InvalidCredentialsException.class)
    public ResponseEntity<ErrorResponse> handleInvalidCredentials(InvalidCredentialsException ex, HttpServletRequest request) {
        log.error("Erro ao autenticar: {}", ex.getMessage());
        return buildErrorResponse(ex.getMessage(), HttpStatus.UNAUTHORIZED, request);
    }

    @ExceptionHandler(LoginServiceUnavailableException.class)
    public ResponseEntity<ErrorResponse> handleLoginServiceUnavailableException(LoginServiceUnavailableException ex,
                                                                                HttpServletRequest request) {
        log.error("Erro ao autenticar: {}", ex.getMessage());
        return buildErrorResponse(ex.getMessage(), HttpStatus.SERVICE_UNAVAILABLE, request);
    }

    @ExceptionHandler(PacienteNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleNotFound(PacienteNotFoundException ex, HttpServletRequest request) {
        log.error("Paciente não encontrado: {}", ex.getMessage());
        return buildErrorResponse(ex.getMessage(), HttpStatus.NOT_FOUND, request);
    }

    private ResponseEntity<ErrorResponse> buildErrorResponse(String message, HttpStatus status, HttpServletRequest request) {
        return ResponseEntity.status(status).body(new ErrorResponse(
                message,
                status.value(),
                request.getRequestURI(),
                Instant.now()
        ));
    }
}
