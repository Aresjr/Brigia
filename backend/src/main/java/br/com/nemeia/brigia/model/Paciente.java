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
@Table(name = "paciente")
public class Paciente extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "cpf")
    private String cpf;

    @Column(name = "data_nascimento")
    private LocalDate dataNascimento;

    @Column(name = "sexo")
    private Character sexo;

    @Column(name = "celular")
    private String celular;

    @Column(name = "ultima_consulta")
    private LocalDateTime ultimaConsulta;

    @Column(name = "proxima_consulta")
    private LocalDateTime proximaConsulta;

    @Column(name = "url_imagem")
    private String urlImagem;

    @Column(name = "cor_identificacao")
    private String corIdentificacao;

    @Column(name = "cep")
    private String cep;

    @Column(name = "rua")
    private String rua;

    @Column(name = "complemento")
    private String complemento;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "cidade")
    private String cidade;

    @Column(name = "uf")
    private String uf;

    @ManyToOne
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;
}
