package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Disponibilidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;

public interface DisponibilidadeRepository extends BaseRepository<Disponibilidade> {
    Page<Disponibilidade> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);

    @Query("SELECT d FROM Disponibilidade d WHERE d.dia BETWEEN :startDate AND :endDate")
    Page<Disponibilidade> findAllByDateRange(Pageable pageable, @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate);
}
