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
@Table(name = "atendimento_procedimento")
public class AtendimentoProcedimento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "atendimento_id")
    private Atendimento atendimento;

    @ManyToOne(optional = false)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Column(name = "quantidade", nullable = false)
    private Long quantidade;

    @Column(name = "valor")
    private BigDecimal valor;

    public AtendimentoProcedimento(Atendimento atendimento, Procedimento procedimento, Long quantidade,
            BigDecimal valor) {
        this.atendimento = atendimento;
        this.procedimento = procedimento;
        this.quantidade = quantidade;
        this.valor = valor;
    }
}
