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

  @CreatedDate
  private LocalDateTime criadoEm;

  @CreatedBy
  @Column(length = 36)
  private String criadoPor;

  @LastModifiedDate
  private LocalDateTime atualizadoEm;

  @LastModifiedBy
  @Column(length = 36)
  private String atualizadoPor;

  private LocalDateTime excluidoEm;

  @Column(length = 36)
  private String excluidoPor;

  private Boolean excluido = false;

  @PreUpdate
  protected void onUpdate() {
    if (atualizadoEm == null) {
      atualizadoEm = LocalDateTime.now();
    }
  }
}
