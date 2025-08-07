package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.Set;

import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "especialidade")
public class Especialidade extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "nome", nullable = false)
  private String nome;

  @Column(name = "descricao")
  private String descricao;

  @ManyToMany
  @JoinTable(
      name = "profissional_especialidade",
      joinColumns = @JoinColumn(name = "especialidade_id"),
      inverseJoinColumns = @JoinColumn(name = "profissional_id"))
  private Set<Profissional> profissionais;

  public Especialidade(String nome, String descricao) {
    this.nome = nome;
    this.descricao = descricao;
  }
}
