package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Optional;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "conta_receber")
public class ContaReceber extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "atendimento_id")
    private Atendimento atendimento;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id")
    private Profissional profissional;

    @Column(name = "valor_atendimento", precision = 10, scale = 2)
    private BigDecimal valorAtendimento;

    @Column(name = "valor_total_lancado", precision = 10, scale = 2)
    private BigDecimal valorTotalLancado;

    @Column(name = "valor_desconto", precision = 10, scale = 2)
    private BigDecimal valorDesconto;

    @Column(name = "valor_recebido", precision = 10, scale = 2)
    private BigDecimal valorRecebido;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 2)
    private FormaPagamento formaPagamento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "status")
    private StatusContaReceber status;

    public BigDecimal getValorTotal() {
      return valorAtendimento.add(valorTotalLancado).subtract(valorDesconto);
    }
}
