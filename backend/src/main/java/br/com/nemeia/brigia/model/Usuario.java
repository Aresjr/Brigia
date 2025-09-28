package br.com.nemeia.brigia.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import lombok.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

@Data
@Entity
@Table(name = "usuario")
public class Usuario extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "senha")
    private String senha;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "avatar_url")
    private String avatarUrl;

    @Enumerated(EnumType.STRING)
    @Column(name = "roles", nullable = false)
    @JdbcTypeCode(SqlTypes.ARRAY)
    private List<RoleUsuario> roles;

    @Column(name = "token_publico")
    private String tokenPublico;

    @Column(name = "token_expiracao")
    private LocalDateTime tokenExpiracao;

    @PrePersist
    public void prePersist() {
      if (tokenPublico == null) {
        tokenPublico = UUID.randomUUID().toString();
      }
      if (tokenExpiracao == null) {
        tokenExpiracao = LocalDateTime.now().plusHours(1);
      }
    }
}
