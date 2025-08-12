package br.com.nemeia.brigia.dto.response;

import java.time.Instant;
import java.util.List;
import org.springframework.http.HttpStatus;

public record ErrorResponse(
    String message, List<String> messages, HttpStatus status, String path, Instant timestamp) {}
