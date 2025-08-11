package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "procedimento")
public class Procedimento extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "codigo", unique = true)
  private String codigo;

  @Column(name = "nome", nullable = false, unique = true)
  private String nome;

  @Column(name = "observacoes")
  private String observacoes;

  @Column(name = "valor_padrao")
  private BigDecimal valorPadrao;

  @ManyToOne
  @JoinColumn(name = "especialidade_id")
  private Especialidade especialidade;

  public Procedimento(String codigo, String nome, String observacoes, BigDecimal valorPadrao) {
    this.codigo = codigo;
    this.nome = nome;
    this.observacoes = observacoes;
    this.valorPadrao = valorPadrao;
  }
}
