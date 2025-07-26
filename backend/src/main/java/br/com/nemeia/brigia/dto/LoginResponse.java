package br.com.nemeia.brigia.dto;

public record LoginResponse(
    String accessToken,
    String id,
    String email,
    String name,
    String avatarUrl,
    String role,
    String theme,
    Integer establishment
) { }
