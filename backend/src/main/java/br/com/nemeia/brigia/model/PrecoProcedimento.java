package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "preco_procedimento")
public class PrecoProcedimento extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne
  @JoinColumn(name = "procedimento_id", nullable = false)
  private Procedimento procedimento;

  @ManyToOne
  @JoinColumn(name = "convenio_id", nullable = false)
  private Convenio convenio;

  @ManyToOne
  @JoinColumn(name = "unidade_id", nullable = false)
  private Unidade unidade;

  @Column(name = "preco", nullable = false)
  private BigDecimal preco;

  @Column(name = "repasse")
  private BigDecimal repasse;

  @Column(name = "observacao")
  private String observacao;
}
