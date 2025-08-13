package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.util.List;
import lombok.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

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

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "unidade_id", nullable = false)
  private Unidade unidade;

  @Column(name = "avatar_url")
  private String avatarUrl;

  @Enumerated(EnumType.STRING)
  @Column(name = "roles", nullable = false)
  @JdbcTypeCode(SqlTypes.ARRAY)
  private List<RoleUsuario> roles;
}
