package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "orcamento_procedimento")
public class OrcamentoProcedimento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "orcamento_id")
    private Orcamento orcamento;

    @ManyToOne(optional = false)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Column(name = "quantidade", nullable = false)
    private Integer quantidade;

    @Column(name = "valor")
    private BigDecimal valor;

    @Column(name = "valor_repasse")
    private BigDecimal valorRepasse;

    @Column(name = "desconto")
    private BigDecimal desconto;

    public OrcamentoProcedimento(Orcamento orcamento, Procedimento procedimento, Integer quantidade) {
        this.orcamento = orcamento;
        this.procedimento = procedimento;
        this.quantidade = quantidade;
    }
}
