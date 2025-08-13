package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "agendamento")
public class Agendamento extends BaseModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "data")
  private LocalDateTime data;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "paciente_id")
  private Paciente paciente;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "profissional_id")
  private Profissional profissional;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "procedimento_id")
  private Procedimento procedimento;

  @Enumerated(EnumType.ORDINAL)
  @Column(name = "status", length = 15, nullable = false)
  private StatusAgendamento status;
}
