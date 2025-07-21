package br.com.nemeia.brigia.model;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;

import java.time.LocalDateTime;

@MappedSuperclass
public abstract class BaseModel {

    private LocalDateTime criadoEm;

    private Boolean excluido;

    @PrePersist
    protected void onCreate() {
        if (criadoEm == null) {
            criadoEm = LocalDateTime.now();
        }
        if (excluido == null) {
            excluido = false;
        }
    }
}
