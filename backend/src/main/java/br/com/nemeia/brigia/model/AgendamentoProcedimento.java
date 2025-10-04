package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "agendamento_procedimento")
public class AgendamentoProcedimento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "agendamento_id")
    private Agendamento agendamento;

    @ManyToOne(optional = false)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Column(name = "quantidade", nullable = false)
    private Integer quantidade;

    public AgendamentoProcedimento(Agendamento agendamento, Procedimento procedimento, Integer quantidade) {
        this.agendamento = agendamento;
        this.procedimento = procedimento;
        this.quantidade = quantidade;
    }
}
