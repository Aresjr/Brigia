package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "procedimento_plano")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProcedimentoPlano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "procedimento_id", nullable = false)
    private Procedimento procedimento;

    @ManyToOne
    @JoinColumn(name = "plano_id", nullable = false)
    private EmpresaPlano plano;

    @ManyToOne
    @JoinColumn(name = "unidade_id")
    private Unidade unidade;

    @Column(nullable = false)
    private BigDecimal preco;

    @Column
    private BigDecimal repasse;

    public ProcedimentoPlano(Procedimento procedimento, EmpresaPlano plano, Unidade unidade, BigDecimal preco,
            BigDecimal repasse) {
        this.procedimento = procedimento;
        this.plano = plano;
        this.unidade = unidade;
        this.preco = preco;
        this.repasse = repasse;
    }
}
