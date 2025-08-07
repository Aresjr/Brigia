package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.Set;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
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
}
