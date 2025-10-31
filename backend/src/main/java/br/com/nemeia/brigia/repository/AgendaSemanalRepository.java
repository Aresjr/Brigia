package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.AgendaSemanal;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

public interface AgendaSemanalRepository extends BaseRepository<AgendaSemanal> {

    @Query("SELECT a FROM AgendaSemanal a WHERE " + "(a.excluido IS NULL OR a.excluido = false) "
            + "AND (:profissionalId IS NULL OR a.profissional.id = :profissionalId)")
    List<AgendaSemanal> findAllByProfissionalId(@Param("profissionalId") Long profissionalId);

    @Query("SELECT a FROM AgendaSemanal a WHERE " + "a.profissional.id = :profissionalId "
            + "AND a.diaSemana = :diaSemana " + "AND (a.excluido IS NULL OR a.excluido = false)")
    List<AgendaSemanal> findByProfissionalIdAndDiaSemana(@Param("profissionalId") Long profissionalId,
            @Param("diaSemana") Integer diaSemana);

    @Query("SELECT a FROM AgendaSemanal a WHERE " + "a.profissional.id = :profissionalId "
            + "AND a.diaSemana = :diaSemana " + "AND :hora >= a.horaInicial " + "AND :hora <= a.horaFinal "
            + "AND (a.excluido IS NULL OR a.excluido = false)")
    Optional<AgendaSemanal> findByProfissionalAndDiaSemanaAndHora(@Param("profissionalId") Long profissionalId,
            @Param("diaSemana") Integer diaSemana, @Param("hora") LocalTime hora);
}
