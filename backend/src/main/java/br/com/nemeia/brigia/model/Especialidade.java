package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.List;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "especialidade")
public class Especialidade extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "nome", nullable = false, unique = true)
  private String nome;

  @Column(name = "descricao")
  private String descricao;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "profissional_especialidade",
      joinColumns = @JoinColumn(name = "especialidade_id"),
      inverseJoinColumns = @JoinColumn(name = "profissional_id"))
  private List<Profissional> profissionais;

  public Especialidade(String nome, String descricao) {
    this.nome = nome;
    this.descricao = descricao;
  }
}
