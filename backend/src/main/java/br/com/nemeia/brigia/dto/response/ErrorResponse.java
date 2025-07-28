package br.com.nemeia.brigia.dto.response;

import java.time.Instant;

public record ErrorResponse(String message, int status, String path, Instant timestamp) {}
