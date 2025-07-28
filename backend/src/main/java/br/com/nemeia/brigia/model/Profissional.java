package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.Set;
import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "profissional")
public class Profissional extends BaseModel {

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

  @Column(name = "url_imagem")
  private String urlImagem;

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

  @ManyToMany
  @JoinTable(
      name = "profissional_especialidade",
      joinColumns = @JoinColumn(name = "profissional_id"),
      inverseJoinColumns = @JoinColumn(name = "especialidade_id"))
  private Set<Especialidade> especialidades;
}
