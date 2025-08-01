package br.com.nemeia.brigia.dto.response;

import org.springframework.http.HttpStatus;

import java.time.Instant;
import java.util.List;

public record ErrorResponse(
        String message,
        List<String> messages,
        HttpStatus status,
        String path,
        Instant timestamp) {}
