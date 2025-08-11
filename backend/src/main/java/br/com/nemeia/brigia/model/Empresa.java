package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "empresa")
public class Empresa extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "nome", unique = true, nullable = false)
  private String nome;

  @Column(name = "descricao")
  private String descricao;

  public Empresa(String nome, String descricao) {
    this.nome = nome;
    this.descricao = descricao;
  }
}
