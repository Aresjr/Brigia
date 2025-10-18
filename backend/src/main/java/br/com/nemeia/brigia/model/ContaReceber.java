package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

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
    @JoinColumn(name = "agendamento_id")
    private Agendamento agendamento;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id")
    private Profissional profissional;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    @Column(name = "data_agendamento")
    private LocalDate dataAgendamento;

    @Column(name = "valor_agendamento", precision = 10, scale = 2)
    private BigDecimal valorAgendamento;

    @Column(name = "valor_procedimentos_adicionais", precision = 10, scale = 2)
    private BigDecimal valorProcedimentosAdicionais;

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
        return valorAgendamento.add(valorProcedimentosAdicionais).subtract(valorDesconto);
    }

    public Boolean isFaturado() {
        return Objects.equals(valorRecebido, getValorTotal());
    }
}
