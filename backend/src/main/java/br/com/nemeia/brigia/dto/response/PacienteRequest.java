package br.com.nemeia.brigia.dto.response;

import jakarta.validation.constraints.*;

import java.time.LocalDate;

public record PacienteRequest(
    @NotBlank
    String nome,
    String email,
    String cpf,
    @NotNull
    LocalDate dataNascimento,
    @Pattern(regexp = "^[MFO]$")
    String sexo,
    String celular,
    String urlImagem,
    @Pattern(regexp = "^[a-zA-Z0-9]+$")
    String corIdentificacao,
    @Null
    @Pattern(regexp = "^\\d{5}-\\d{3}$")
    String cep,
    String rua,
    String complemento,
    String bairro,
    String cidade,
    @Null
    @Max(2)
    String uf,
    Long convenioId) {}
