package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "agenda_medico")
public class AgendaMedico extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissional_id", nullable = false)
    private Profissional profissional;

    /**
     * Data específica para agenda diária (NULL para agenda semanal)
     */
    @Column(name = "dia")
    private LocalDate dia;

    /**
     * Dia da semana para agenda semanal (NULL para agenda diária)
     * 0 = Domingo, 1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta, 5 = Sexta, 6 = Sábado
     */
    @Column(name = "dia_semana")
    private Integer diaSemana;

    @Column(name = "hora_inicial", nullable = false)
    private LocalTime horaInicial;

    @Column(name = "hora_final", nullable = false)
    private LocalTime horaFinal;

    @Column(name = "valor_adicional", precision = 10, scale = 2)
    private BigDecimal valorAdicional;

    /**
     * Verifica se esta agenda é semanal (recorrente)
     */
    public boolean isAgendaSemanal() {
        return diaSemana != null;
    }

    /**
     * Verifica se esta agenda é diária (data específica)
     */
    public boolean isAgendaDiaria() {
        return dia != null;
    }
}
