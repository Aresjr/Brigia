package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "preco_procedimento")
public class PrecoProcedimento extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "procedimento_id", nullable = false)
  private Procedimento procedimento;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "convenio_id")
  private Convenio convenio;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "unidade_id")
  private Unidade unidade;

  @Column(name = "preco", nullable = false)
  private BigDecimal preco;

  @Column(name = "repasse")
  private BigDecimal repasse;

  @Column(name = "observacao")
  private String observacao;
}
