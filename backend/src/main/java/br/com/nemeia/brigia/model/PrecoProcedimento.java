package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "a_preco_procedimento")
public class PrecoProcedimento extends BaseModel {

    @EmbeddedId
    private PrecoProcedimentoId id;

    @Column(name = "preco", nullable = false)
    private BigDecimal preco;
}
