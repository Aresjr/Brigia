package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.List;
import lombok.*;

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

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "especialidade_id")
  private Especialidade especialidade;

  @OneToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "preco_procedimento",
      joinColumns = @JoinColumn(name = "procedimento_id"),
      inverseJoinColumns = @JoinColumn(name = "id"))
  private List<PrecoProcedimento> precos;

  public Procedimento(String codigo, String nome, String observacoes, BigDecimal valorPadrao) {
    this.codigo = codigo;
    this.nome = nome;
    this.observacoes = observacoes;
    this.valorPadrao = valorPadrao;
  }
}
