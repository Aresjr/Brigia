package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "orcamento")
public class Orcamento extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id", nullable = false)
    private Paciente paciente;

    @Column(name = "data", nullable = false)
    private LocalDate data;

    @Column(name = "hora", nullable = false)
    private LocalTime hora;

    @Column(name = "duracao")
    private Integer duracao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "especialidade_id")
    private Especialidade especialidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "procedimento_id")
    private Procedimento procedimento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 2)
    private FormaPagamento formaPagamento;

    @Column(name = "valor", nullable = false)
    private BigDecimal valor;

    @Column(name = "desconto")
    private BigDecimal desconto;

    @Column(name = "observacoes")
    private String observacoes;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "tipo_agendamento", length = 2, nullable = false)
    private TipoAgendamento tipoAgendamento;

    @Column(name = "preco_alterado", nullable = false)
    private Boolean precoAlterado = false;

    @OneToMany(mappedBy = "agendamento", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AgendamentoProcedimento> procedimentos = new ArrayList<>();
}
