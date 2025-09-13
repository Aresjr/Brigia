package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "procedimento_atendimento")
public class ProcedimentoAtendimento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "atendimento_id")
    private Atendimento atendimento;

    @ManyToOne(optional = false)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    private Long quantidade;

    public ProcedimentoAtendimento(Atendimento atendimento, Procedimento procedimento, Long quantidade) {
        this.atendimento = atendimento;
        this.procedimento = procedimento;
        this.quantidade = quantidade;
    }
}
