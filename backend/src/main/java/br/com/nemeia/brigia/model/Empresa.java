package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
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

  @Column(name = "observacao")
  private String observacao;

  @Column(name = "codigo_bc")
  private String codigoBc;

  @Column(name = "valor_minimo_mensal")
  private BigDecimal valorMinimoMensal;

  @Column(name = "minimo_por_funcionario")
  private BigDecimal minimoPorFuncionario;

  @Column(name = "valor_mes")
  private BigDecimal valorMes;

  @Column(name = "func")
  private Long func;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unidade_id")
    private Unidade unidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_plano_id")
    private EmpresaPlano plano;
}
