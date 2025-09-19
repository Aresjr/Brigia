package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

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

    @Column(name = "valor_total", precision = 10, scale = 2)
    private BigDecimal valorTotal;

    @Column(name = "valor_recebido", precision = 10, scale = 2)
    private BigDecimal valorRecebido;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "forma_pagamento", length = 2)
    private FormaPagamento formaPagamento;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "status")
    private StatusContaReceber status;

    @OneToMany(mappedBy = "contaReceber", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ContaReceberItem> itens = new ArrayList<>();

}
