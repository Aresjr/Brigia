package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "empresa_plano")
public class EmpresaPlano {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "nome", unique = true, nullable = false)
  private String nome;

  @Column(name = "cor_fundo")
  private String corFundo = "bg-white";
}
