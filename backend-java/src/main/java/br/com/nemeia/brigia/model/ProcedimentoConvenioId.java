package br.com.nemeia.brigia.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class ProcedimentoConvenioId {

    @Column
    private Long procedimentoId;

    @Column
    private Long convenioId;

}
