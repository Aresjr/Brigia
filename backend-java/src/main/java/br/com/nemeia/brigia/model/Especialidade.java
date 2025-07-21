package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "a_especialidade")
public class Especialidade extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nome;

    private String descricao;
}
