package br.com.nemeia.brigia.model;

import br.com.nemeia.brigia.auth.SecurityHolder;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import lombok.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Data
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseModel {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "unidade_id", nullable = false)
    private Unidade unidade;

    @CreatedDate
    private LocalDateTime criadoEm;

    @CreatedBy
    @Column(name = "criado_por")
    private Long criadoPor;

    @LastModifiedDate
    @Column(name = "atualizado_em")
    private LocalDateTime atualizadoEm;

    @LastModifiedBy
    @Column(name = "atualizado_por")
    private Long atualizadoPor;

    @Column(name = "excluido_em")
    private LocalDateTime excluidoEm;

    @Column(name = "excluido_por")
    private Long excluidoPor;

    @Column(name = "excluido")
    private Boolean excluido = false;

    @PrePersist
    protected void onCreate() {
      if (unidade == null) {
        Long unidadeId = SecurityHolder.getLoggedUserUnidadeId();
        if (unidadeId != null) {
          this.unidade = new Unidade(unidadeId);
        }
      }
    }

    @PreUpdate
    protected void onUpdate() {
        if (atualizadoEm == null) {
            atualizadoEm = LocalDateTime.now();
        }
    }
}
