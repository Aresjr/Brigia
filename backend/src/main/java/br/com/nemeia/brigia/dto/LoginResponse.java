package br.com.nemeia.brigia.dto;

public record LoginResponse(
    String name,
    String avatarUrl,
    String role,
    String theme,
    Integer unidade
) { }
