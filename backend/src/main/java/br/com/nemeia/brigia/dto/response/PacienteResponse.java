package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;

public record PacienteResponse(Long id, String nome, String nomeSocial, String pressaoArterial, String email,
        String cpf, @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate dataNascimento,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm") LocalDateTime ultimaConsulta,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm") LocalDateTime proximaConsulta,
        String urlImagem, Character sexo, String celular, String celular2, String fixo, String documento,
        String profissao, String peso, String altura, String corIdentificacao, String cep, String rua,
        String complemento, String bairro, String cidade, String uf, ConvenioResponse convenio, EmpresaResponse empresa,
        LocalDateTime criadoEm, Boolean excluido) {
}
