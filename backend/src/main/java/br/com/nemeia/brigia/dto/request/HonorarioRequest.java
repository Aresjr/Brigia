package br.com.nemeia.brigia.dto.request;

import java.math.BigDecimal;
import java.time.LocalDate;

public record HonorarioRequest(Long profissionalId, LocalDate data, BigDecimal valorHora) {
}
