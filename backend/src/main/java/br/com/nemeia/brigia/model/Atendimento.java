package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "atendimento")
public class Atendimento extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "agendamento_id")
    private Agendamento agendamento;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id", nullable = false)
    private Paciente paciente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id", nullable = false)
    private Profissional profissional;

    @Column(name = "data", nullable = false)
    private LocalDate data;

    @Column(name = "hora_inicio", nullable = false)
    private LocalTime horaInicio;

    @Column(name = "hora_fim")
    private LocalTime horaFim;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unidade_id", nullable = false)
    private Unidade unidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "especialidade_id")
    private Especialidade especialidade;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 15)
    private FormaPagamento formaPagamento;

    @Column(name = "anamnese", columnDefinition = "TEXT")
    private String anamnese;

    @Column(name = "exame_fisico", columnDefinition = "TEXT")
    private String exameFisico;

    @Column(name = "diagnostico", columnDefinition = "TEXT")
    private String diagnostico;

    @Column(name = "evolucao_clinica", columnDefinition = "TEXT")
    private String evolucaoClinica;

    @Column(name = "exames_solicitados", columnDefinition = "TEXT")
    private String examesSolicitados;

    @Column(name = "prescricoes", columnDefinition = "TEXT")
    private String prescricoes;

    @Column(name = "observacoes", columnDefinition = "TEXT")
    private String observacoes;

    @OneToMany(mappedBy = "atendimento", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProcedimentoAtendimento> procedimentos = new ArrayList<>();

    @Column(name = "valor_total")
    private BigDecimal valorTotal;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "status", length = 15, nullable = false)
    private StatusAtendimento status;
}
