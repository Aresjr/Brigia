package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "disponibilidade")
public class Disponibilidade extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id", nullable = false)
    private Profissional profissional;

    @Column(name = "dia", nullable = false)
    private LocalDate dia;

    @Column(name = "hora_inicial", nullable = false)
    private LocalTime horaInicial;

    @Column(name = "hora_final", nullable = false)
    private LocalTime horaFinal;
}
