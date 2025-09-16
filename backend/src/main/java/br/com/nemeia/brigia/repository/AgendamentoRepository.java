package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Agendamento;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;

public interface AgendamentoRepository extends BaseRepository<Agendamento> {
    @Query("SELECT a FROM Agendamento a WHERE a.profissional.id = :profissionalId " +
           "AND a.data BETWEEN :startDate AND :endDate")
    Page<Agendamento> findAllByProfissionalIdAndDateRange(
        Pageable pageable,
        @Param("profissionalId") Long profissionalId,
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate
    );

    @Query("SELECT a FROM Agendamento a WHERE a.data BETWEEN :startDate AND :endDate")
    Page<Agendamento> findAllByDateRange(
        Pageable pageable,
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate
    );
}
