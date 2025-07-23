package br.com.nemeia.brigia.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class ProcedimentoConvenioId {

    @Column(name = "procedimento_id")
    private Long procedimentoId;

    @Column(name = "convenio_id")
    private Long convenioId;
}
