package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "preco_procedimento")
public class PrecoProcedimento extends BaseModel {

  @EmbeddedId
  private PrecoProcedimentoId id;

  @Column(name = "preco", nullable = false)
  private BigDecimal preco;

  @Column(name = "observacao")
  private String observacao;
}
