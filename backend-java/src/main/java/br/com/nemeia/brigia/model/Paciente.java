package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "a_paciente")
public class Paciente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;

    private String cpf;

    private LocalDate dataNascimento;

    private Character sexo;

    private String celular;

    private LocalDateTime ultimaConsulta;

    private LocalDateTime proximaConsulta;

    private String urlImagem;

    private String corIdentificacao;

    private String cep;

    private String rua;

    private String complemento;

    private String bairro;

    private String cidade;

    private String uf;

    @OneToOne
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    private LocalDateTime criadoEm;

    private Boolean excluido;
}
