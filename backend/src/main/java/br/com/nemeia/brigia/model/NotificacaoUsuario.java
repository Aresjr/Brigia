package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(
        name = "notificacao_usuario",
        uniqueConstraints = @UniqueConstraint(name = "uk_notificacao_usuario", columnNames = {"notificacao_id", "usuario_id"}))
public class NotificacaoUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "notificacao_id", nullable = false)
    private Notificacao notificacao;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @Column(name = "lida", nullable = false)
    private Boolean lida = false;

    @Column(name = "lida_em")
    private LocalDateTime lidaEm;

    public void marcarComoLida() {
        if (Boolean.FALSE.equals(lida)) {
            this.lida = true;
            this.lidaEm = LocalDateTime.now();
        }
    }
}
