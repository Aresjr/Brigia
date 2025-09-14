package br.com.nemeia.brigia.dto.response;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public record ProfissionalResponse(Long id, String nome, String email, String cpf, LocalDate dataNascimento,
        Character sexo, String celular, String urlImagem, String crm, List<EspecialidadeResponse> especialidades,
        LocalDateTime criadoEm, Boolean excluido) {
}
