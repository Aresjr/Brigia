package br.com.nemeia.brigia.dto;

import java.time.Instant;

public record ErrorResponse(
        String message,
        int status,
        String path,
        Instant timestamp) {

}