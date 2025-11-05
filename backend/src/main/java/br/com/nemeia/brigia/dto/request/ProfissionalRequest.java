package br.com.nemeia.brigia.dto.request;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public record ProfissionalRequest(@NotBlank(message = "Nome é obrigatório") String nome,
        @Email(message = "O email deve ser válido") @NotBlank(message = "O email é obrigatório") String email,
        @Nullable String cpf, @NotNull LocalDate dataNascimento,
        @Nullable @Pattern(regexp = "^[MFO]$", message = "Sexo deve ser 'M', 'F' ou 'O'") String sexo,
        @Pattern(regexp = "^\\d{11}$", message = "Celuar com formato inválido, deve conter 11 dígitos") String celular,
        String urlImagem,
        @Pattern(regexp = "^\\d{7}$", message = "CRM com formato inválido, deve conter 7 dígitos") String crm,
        @Nullable BigDecimal valorHora, List<Long> especialidades) {
}
