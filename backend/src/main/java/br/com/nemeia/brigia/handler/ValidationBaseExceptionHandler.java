package br.com.nemeia.brigia.handler;

import br.com.nemeia.brigia.dto.response.ErrorResponse;
import br.com.nemeia.brigia.mapper.ValidationMessageMapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

@RestControllerAdvice
@RequiredArgsConstructor
@Slf4j
public class ValidationBaseExceptionHandler extends BaseExceptionHandler {

  private final ValidationMessageMapper mapper;

  @ExceptionHandler(MethodArgumentNotValidException.class)
  public ResponseEntity<ErrorResponse> handleValidationErrors(
      MethodArgumentNotValidException ex, HttpServletRequest request) {
    List<String> errors = mapper.extractMsg(ex);
    return buildErrorResponse(errors, HttpStatus.BAD_REQUEST, request);
  }

  @ExceptionHandler(DataIntegrityViolationException.class)
  public ResponseEntity<ErrorResponse> handleDataIntegrityViolation(DataIntegrityViolationException ex,
          HttpServletRequest request) {
    String msg = mapper.extractMsg(ex);
    return buildErrorResponse(msg, HttpStatus.BAD_REQUEST, request);
  }
}
