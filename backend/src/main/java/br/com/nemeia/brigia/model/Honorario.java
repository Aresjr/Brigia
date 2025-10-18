package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "honorario")
public class Honorario extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id", nullable = false)
    private Profissional profissional;

    @Column(name = "data", nullable = false)
    private LocalDate data;

    @Column(name = "valor_total", nullable = false)
    private BigDecimal valorTotal;

    @Column(name = "quantidade_atendimentos", nullable = false)
    private Integer quantidadeAtendimentos;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unidade_id", nullable = false)
    private Unidade unidade;

    public Honorario(Profissional profissional, LocalDate data, BigDecimal valorTotal, Integer quantidadeAtendimentos,
            Unidade unidade) {
        this.profissional = profissional;
        this.data = data;
        this.valorTotal = valorTotal;
        this.quantidadeAtendimentos = quantidadeAtendimentos;
        this.unidade = unidade;
    }
}
