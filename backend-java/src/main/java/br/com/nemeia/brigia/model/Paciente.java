package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "a_paciente")
public class Paciente extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @ManyToOne
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;
}
