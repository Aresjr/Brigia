package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "agendamento")
public class Agendamento extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id", nullable = false)
    private Paciente paciente;

    @Column(name = "dia", nullable = false)
    private LocalDate dia;

    @Column(name = "hora", nullable = false)
    private LocalTime hora;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "especialidade_id")
    private Especialidade especialidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id", nullable = false)
    private Profissional profissional;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "status", length = 15, nullable = false)
    private StatusAgendamento status;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 15)
    private FormaPagamento formaPagamento;

    @Column(name = "valor", nullable = false)
    private BigDecimal valor;

    @Column(name = "desconto")
    private BigDecimal desconto;
}
