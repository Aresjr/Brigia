package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Disponibilidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface DisponibilidadeRepository extends BaseRepository<Disponibilidade> {
    Page<Disponibilidade> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);

    @Query("SELECT d FROM Disponibilidade d WHERE d.dia BETWEEN :startDate AND :endDate "
            + "AND d.unidade.id = :unidadeId AND d.disponivel = true")
    Page<Disponibilidade> findAllByDateRange(Pageable pageable, @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate, @Param("unidadeId") Long unidadeId);

    @Query("SELECT d FROM Disponibilidade d WHERE d.profissional.id = :profissionalId AND d.dia = :dia "
            + "AND d.horaInicial <= :horaInicial AND d.horaFinal >= :horaFinal AND d.unidade.id = :unidadeId "
            + "AND (d.excluido IS NULL OR d.excluido = false) AND d.disponivel = true")
    java.util.Optional<Disponibilidade> findByProfissionalAndDiaAndHora(@Param("profissionalId") Long profissionalId,
            @Param("dia") LocalDate dia, @Param("horaInicial") LocalTime horaInicial,
            @Param("horaFinal") LocalTime horaFinal, @Param("unidadeId") Long unidadeId);

    @Query("SELECT d FROM Disponibilidade d WHERE d.profissional.id = :profissionalId AND d.dia = :dia "
            + "AND d.unidade.id = :unidadeId AND (d.excluido IS NULL OR d.excluido = false) "
            + "AND ((d.horaInicial < :horaFinal AND d.horaFinal > :horaInicial)) AND d.disponivel = true")
    List<Disponibilidade> findConflitosHorario(@Param("profissionalId") Long profissionalId,
            @Param("dia") LocalDate dia, @Param("horaInicial") LocalTime horaInicial,
            @Param("horaFinal") LocalTime horaFinal, @Param("unidadeId") Long unidadeId);

    @Query("SELECT d FROM Disponibilidade d WHERE d.profissional.id = :profissionalId AND d.dia = :dia "
            + "AND d.unidade.id = :unidadeId AND d.disponivel = true")
    List<Disponibilidade> findDisponibilidadesDia(@Param("profissionalId") Long profissionalId,
            @Param("dia") LocalDate dia, @Param("unidadeId") Long unidadeId);

    @Query("SELECT d FROM Disponibilidade d WHERE d.dia BETWEEN :startDate AND :endDate "
            + "AND d.unidade.id = :unidadeId AND d.profissional.id = :profissionalId AND d.disponivel = true")
    Page<Disponibilidade> findAllByDateRangeAndProfissional(Pageable pageable, @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate, @Param("unidadeId") Long unidadeId, @Param("profissionalId") Long profissionalId);
}
