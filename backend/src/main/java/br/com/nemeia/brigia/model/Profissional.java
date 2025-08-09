package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.List;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "profissional")
public class Profissional extends BaseModel {

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

  @Column(name = "sexo")
  private Character sexo;

  @Column(name = "celular", unique = true)
  private String celular;

  @Column(name = "url_imagem")
  private String urlImagem;

  @Column(name = "crm", length = 7, unique = true)
  private String crm;

  @ManyToMany
  @JoinTable(
      name = "profissional_especialidade",
      joinColumns = @JoinColumn(name = "profissional_id"),
      inverseJoinColumns = @JoinColumn(name = "especialidade_id"))
  private List<Especialidade> especialidades; //TODO - verificar outros lugares que usam SET, trocar para LIST

  public Profissional(String nome, String email, String cpf, LocalDate dataNascimento,
                      Character sexo, String celular, String urlImagem, String crm) {
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
    this.dataNascimento = dataNascimento;
    this.sexo = sexo;
    this.celular = celular;
    this.urlImagem = urlImagem;
    this.crm = crm;
  }

}
