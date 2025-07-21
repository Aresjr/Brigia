package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "a_profissional")
public class Profissional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;

    private String cpf;

    private LocalDate dataNascimento;

    private Character sexo;

    private String celular;

    private String urlImagem;

    private String cep;

    private String rua;

    private String complemento;

    private String bairro;

    private String cidade;

    private String uf;

    private List<Especialidade> especialidades;

    private LocalDateTime criadoEm;

    private Boolean excluido;
}
