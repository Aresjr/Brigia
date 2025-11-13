package br.com.nemeia.brigia.model;

import br.com.nemeia.brigia.auth.SecurityHolder;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "notificacao")
public class Notificacao extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "titulo", nullable = false, length = 255)
    private String titulo;

    @Lob
    @Column(name = "mensagem", nullable = false, columnDefinition = "TEXT")
    private String mensagem;

    @Column(name = "data_notificacao", nullable = false)
    private LocalDateTime dataNotificacao;

    @Column(name = "tipo", length = 50)
    private String tipo;

    @Override
    @PrePersist
    protected void onCreate() {

    }
}
