package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "fila_espera")
public class FilaEspera extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id", nullable = false)
    private Paciente paciente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "especialidade_id", nullable = false)
    private Especialidade especialidade;

    @Column(name = "observacoes", columnDefinition = "TEXT")
    private String observacoes;

    // Campos opcionais do agendamento para facilitar a conversão
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id")
    private Profissional profissional;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "tipo_agendamento", length = 2)
    private TipoAgendamento tipoAgendamento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 2)
    private FormaPagamento formaPagamento;

    @Column(name = "valor")
    private BigDecimal valor;

    @Column(name = "desconto")
    private BigDecimal desconto;

    @Column(name = "duracao")
    private Integer duracao;
}
