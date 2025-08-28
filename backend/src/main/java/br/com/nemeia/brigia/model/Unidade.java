package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "unidade")
public class Unidade extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nome", nullable = false)
    private String nome;

    public Unidade(Long unidadeId) {
        this.id = unidadeId;
    }
}
