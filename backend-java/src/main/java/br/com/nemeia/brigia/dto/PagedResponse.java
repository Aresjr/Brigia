package br.com.nemeia.brigia.dto;

import java.util.List;

public record PagedResponse<T>(
        List<T> content,
        int currentPage,
        int totalPages,
        long totalElements
) {}