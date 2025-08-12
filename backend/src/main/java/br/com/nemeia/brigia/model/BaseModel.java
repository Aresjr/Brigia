package br.com.nemeia.brigia.model;

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

  @CreatedDate private LocalDateTime criadoEm;

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

  @PreUpdate
  protected void onUpdate() {
    if (atualizadoEm == null) {
      atualizadoEm = LocalDateTime.now();
    }
  }
}
