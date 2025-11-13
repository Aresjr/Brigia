package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "convenio")
public class Convenio extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nome", unique = true, nullable = false)
    private String nome;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "particular", nullable = false)
    private Boolean particular = false;

    public Convenio(String nome, String descricao) {
        this.nome = nome;
        this.descricao = descricao;
        this.particular = false;
    }

    public Convenio(String nome, String descricao, Boolean particular) {
        this.nome = nome;
        this.descricao = descricao;
        this.particular = particular != null ? particular : false;
    }
}
