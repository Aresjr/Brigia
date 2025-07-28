package br.com.nemeia.brigia.exception;

import br.com.nemeia.brigia.dto.response.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.time.Instant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

  @ExceptionHandler(InvalidCredentialsException.class)
  public ResponseEntity<ErrorResponse> handleInvalidCredentials(
      InvalidCredentialsException ex, HttpServletRequest request) {
    log.error("Erro ao autenticar: {}", ex.getMessage());
    return buildErrorResponse(ex.getMessage(), HttpStatus.UNAUTHORIZED, request);
  }

  @ExceptionHandler(LoginUnavailableException.class)
  public ResponseEntity<ErrorResponse> handleLoginUnavailableException(
      LoginUnavailableException ex, HttpServletRequest request) {
    log.error("Erro ao autenticar: {}", ex.getMessage());
    return buildErrorResponse(ex.getMessage(), HttpStatus.SERVICE_UNAVAILABLE, request);
  }

  @ExceptionHandler(NotFoundException.class)
  public ResponseEntity<ErrorResponse> handleNotFound(
      NotFoundException ex, HttpServletRequest request) {
    log.error("Entidade não encontrada: {}", ex.getMessage());
    return buildErrorResponse(ex.getMessage(), HttpStatus.NOT_FOUND, request);
  }

  private ResponseEntity<ErrorResponse> buildErrorResponse(
      String message, HttpStatus status, HttpServletRequest request) {
    return ResponseEntity.status(status)
        .body(new ErrorResponse(message, status.value(), request.getRequestURI(), Instant.now()));
  }
}
