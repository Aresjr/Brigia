package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Entity
@Table(name = "procedimento")
public class Procedimento extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "codigo")
  private String codigo;

  @Column(name = "nome", nullable = false)
  private String nome;

  @Column(name = "observacoes")
  private String observacoes;

  @ManyToOne
  @JoinColumn(name = "especialidade_id")
  private Especialidade especialidade;

  public Procedimento(String codigo, String nome, String observacoes) {
    this.codigo = codigo;
    this.nome = nome;
    this.observacoes = observacoes;
    this.especialidade = new Especialidade();
  }
}
