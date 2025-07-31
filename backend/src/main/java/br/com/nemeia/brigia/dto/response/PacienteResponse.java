package br.com.nemeia.brigia.dto.response;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record PacienteResponse(
    Long id,
    String nome,
    String email,
    String cpf,
    LocalDate dataNascimento,
    String sexo,
    String celular,
    LocalDateTime ultimaConsulta,
    LocalDateTime proximaConsulta,
    String urlImagem,
    String corIdentificacao,
    String cep,
    String rua,
    String complemento,
    String bairro,
    String cidade,
    String uf,
    Long convenioId,
    LocalDateTime criadoEm) {}
