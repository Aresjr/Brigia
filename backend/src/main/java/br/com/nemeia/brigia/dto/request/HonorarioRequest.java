package br.com.nemeia.brigia.dto.request;

import java.time.LocalDate;

public record HonorarioRequest(Long profissionalId, LocalDate data) {
}
