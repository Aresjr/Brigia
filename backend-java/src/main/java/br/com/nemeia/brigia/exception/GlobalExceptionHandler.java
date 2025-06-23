package br.com.nemeia.brigia.exception;

import br.com.nemeia.brigia.dto.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.Instant;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(PatientNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleNotFound(PatientNotFoundException ex, HttpServletRequest request) {
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
