package br.com.nemeia.brigia.handler;

import br.com.nemeia.brigia.dto.response.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.time.Instant;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class BaseExceptionHandler {

  protected ResponseEntity<ErrorResponse> buildErrorResponse(
      Object message, HttpStatus status, HttpServletRequest request) {
    return ResponseEntity.status(status)
        .body(new ErrorResponse(message, status.value(), request.getRequestURI(), Instant.now()));
  }
}
