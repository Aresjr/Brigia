package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.util.Set;

@Data
@Entity
@Table(name = "a_profissional")
public class Profissional extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;

    private String cpf;

    private LocalDate dataNascimento;

    private Character sexo;

    private String celular;

    private String urlImagem;

    private String cep;

    private String rua;

    private String complemento;

    private String bairro;

    private String cidade;

    private String uf;

    @ManyToMany
    @JoinTable(
            name = "a_profissional_especialidade",
            joinColumns = @JoinColumn(name = "profissional_id"),
            inverseJoinColumns = @JoinColumn(name = "especialidade_id")
    )
    private Set<Especialidade> especialidades;
}
