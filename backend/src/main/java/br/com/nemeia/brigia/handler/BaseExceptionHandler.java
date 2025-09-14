package br.com.nemeia.brigia.handler;

import br.com.nemeia.brigia.dto.response.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.time.Instant;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class BaseExceptionHandler {

    protected ResponseEntity<ErrorResponse> buildErrorResponse(String message, HttpStatus status,
            HttpServletRequest request) {
        return ResponseEntity.status(status)
                .body(new ErrorResponse(message, null, status, request.getRequestURI(), Instant.now()));
    }

    protected ResponseEntity<ErrorResponse> buildErrorResponse(List<String> messages, HttpStatus status,
            HttpServletRequest request) {
        return ResponseEntity.status(status)
                .body(new ErrorResponse(null, messages, status, request.getRequestURI(), Instant.now()));
    }
}
