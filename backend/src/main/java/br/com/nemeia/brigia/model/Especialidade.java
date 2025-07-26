package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Set;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "especialidade")
public class Especialidade extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "descricao")
    private String descricao;

    @ManyToMany
    @JoinTable(
            name = "profissional_especialidade",
            joinColumns = @JoinColumn(name = "especialidade_id"),
            inverseJoinColumns = @JoinColumn(name = "profissional_id")
    )
    private Set<Profissional> profissionais;
}
