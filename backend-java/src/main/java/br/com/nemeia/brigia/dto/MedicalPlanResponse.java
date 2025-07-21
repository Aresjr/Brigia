package br.com.nemeia.brigia.dto;

import java.time.LocalDateTime;

public record MedicalPlanResponse(
    Integer id,
    String name,
    String description,
    LocalDateTime createdAt
) {}
