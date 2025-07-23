package br.com.nemeia.brigia.dto;

import java.time.LocalDateTime;

public record ConvenioResponse(
    Long id,
    String nome,
    String descricao,
    LocalDateTime criadoEm
) {}
