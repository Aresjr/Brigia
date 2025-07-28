package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.List;
import lombok.*;

@Data
@Entity
@Table(name = "usuario")
public class Usuario {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "email", unique = true, nullable = false)
  private String email;

  @Column(name = "senha", nullable = false)
  private String senha;

  @Column(name = "nome", nullable = false)
  private String nome;

  @ManyToOne
  @JoinColumn(name = "unidade_id", nullable = false)
  private Unidade unidade;

  @Column(name = "avatar_url", nullable = false)
  private String avatarUrl;

  @ElementCollection(fetch = FetchType.EAGER)
  @Enumerated(EnumType.STRING)
  @Column(name = "roles", nullable = false)
  private List<RoleUsuario> roles;
}
