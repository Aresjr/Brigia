package br.com.nemeia.brigia.dto;

import java.time.LocalDateTime;

public record MedicalPlanResponse(
    Long id,
    String name,
    String description,
    LocalDateTime createdAt
) {}
