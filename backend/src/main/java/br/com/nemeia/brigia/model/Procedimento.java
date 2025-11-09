package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.List;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "procedimento")
public class Procedimento extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "codigo", unique = true)
    private String codigo;

    @Column(name = "nome", nullable = false, unique = true)
    private String nome;

    @Column(name = "observacoes")
    private String observacoes;

    @Column(name = "duracao")
    private Integer duracao;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "tipo")
    private TipoAgendamento tipo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "especialidade_id")
    private Especialidade especialidade;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "preco_procedimento", joinColumns = @JoinColumn(name = "procedimento_id"), inverseJoinColumns = @JoinColumn(name = "id"))
    private List<PrecoProcedimento> precos;

    @OneToMany(mappedBy = "procedimento", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<ProcedimentoPlano> precosPlanos;
}
