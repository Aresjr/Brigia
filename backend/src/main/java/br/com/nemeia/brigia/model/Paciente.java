package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "paciente")
public class Paciente extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "nome", nullable = false)
  private String nome;

  @Column(name = "email", unique = true)
  private String email;

  @Column(name = "cpf", unique = true)
  private String cpf;

  @Column(name = "data_nascimento", nullable = false)
  private LocalDate dataNascimento;

  @Column(name = "sexo", length = 1)
  private Character sexo;

  @Column(name = "celular", unique = true, length = 11)
  private String celular;

  @Column(name = "ultima_consulta")
  private LocalDateTime ultimaConsulta;

  @Column(name = "proxima_consulta")
  private LocalDateTime proximaConsulta;

  @Column(name = "url_imagem")
  private String urlImagem;

  @Column(name = "cor_identificacao")
  private String corIdentificacao;

  @Column(name = "cep", length = 8)
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

  public Paciente(String nome, String email, String cpf, LocalDate dataNascimento, Character sexo, String celular,
                  String urlImagem, String corIdentificacao, String cep, String rua, String complemento, String bairro,
                  String cidade, String uf) {
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
    this.dataNascimento = dataNascimento;
    this.sexo = sexo;
    this.celular = celular;
    this.urlImagem = urlImagem;
    this.corIdentificacao = corIdentificacao;
    this.cep = cep;
    this.rua = rua;
    this.complemento = complemento;
    this.bairro = bairro;
    this.cidade = cidade;
    this.uf = uf;
  }
}
