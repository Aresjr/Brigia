package br.com.nemeia.brigia.dto.request;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.*;
import java.time.LocalDate;

public record PacienteRequest(@NotBlank(message = "Nome é obrigatório") String nome, String nomeSocial,
        String pressaoArterial, @Email(message = "O email deve ser válido") String email, @Nullable String cpf,
        @Nullable LocalDate dataNascimento,
        @Nullable @Size(min = 1, max = 1) @Pattern(regexp = "^[MFO]$", message = "Sexo deve ser 'M', 'F' ou 'O'") String sexo,
        @Pattern(regexp = "^\\d{11}$", message = "Celuar com formato inválido, deve conter 11 dígitos") String celular,
        @Nullable @Pattern(regexp = "^\\d{11}$", message = "Celular 2 com formato inválido, deve conter 11 dígitos") String celular2,
        @Nullable @Pattern(regexp = "^\\d{11}$", message = "Fixo com formato inválido, deve conter 11 dígitos") String fixo,
        String urlImagem,
        @Nullable @Pattern(regexp = "^#[a-zA-Z0-9]{6}$", message = "Cor de Identificação deve seguir o padrão alfanumérico") String corIdentificacao,
        @Nullable @Pattern(regexp = "^\\d{8}$", message = "CEP com formato inválido, deve conter 8 dígitos") String cep,
        String rua, String complemento, String bairro, String cidade,
        @Nullable @Size(min = 2, max = 2, message = "Estado deve ser representado por sigla de 2 letras") String uf,
        @Nullable String documento, @Nullable String profissao, @Nullable String peso, @Nullable String altura,
        Long convenioId, Long empresaId) {
}
