package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Agendamento;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Optional;

public interface AgendamentoRepository extends BaseRepository<Agendamento> {
    @Query("SELECT a FROM Agendamento a WHERE a.profissional.id = :profissionalId "
            + "AND a.data BETWEEN :startDate AND :endDate")
    Page<Agendamento> findAllByProfissionalIdAndDateRange(Pageable pageable,
            @Param("profissionalId") Long profissionalId, @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate);

    @Query("SELECT a FROM Agendamento a WHERE a.unidade.id = :unidadeId AND a.data BETWEEN :startDate AND :endDate")
    Page<Agendamento> findAllByDate(Pageable pageable, @Param("unidadeId") Long unidadeId,
            @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query("SELECT a FROM Agendamento a WHERE a.tokenPublico = :token")
    Optional<Agendamento> findOneByToken(@Param("token") String token);
}
