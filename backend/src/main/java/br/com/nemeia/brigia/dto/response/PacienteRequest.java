package br.com.nemeia.brigia.dto.response;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record PacienteRequest(
    String nome,
    String email,
    String cpf,
    LocalDate dataNascimento,
    String sexo,
    String celular,
    String urlImagem,
    String corIdentificacao,
    String cep,
    String rua,
    String complemento,
    String bairro,
    String cidade,
    String uf,
    Long convenioId) {}
