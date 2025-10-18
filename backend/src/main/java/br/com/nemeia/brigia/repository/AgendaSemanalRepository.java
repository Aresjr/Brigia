package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.AgendaSemanal;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AgendaSemanalRepository extends BaseRepository<AgendaSemanal> {

    @Query("SELECT a FROM AgendaSemanal a WHERE " +
            "(a.excluido IS NULL OR a.excluido = false) " +
            "AND (:profissionalId IS NULL OR a.profissional.id = :profissionalId)")
    List<AgendaSemanal> findAllByProfissionalId(@Param("profissionalId") Long profissionalId);

    @Query("SELECT a FROM AgendaSemanal a WHERE " +
            "a.profissional.id = :profissionalId " +
            "AND a.diaSemana = :diaSemana " +
            "AND (a.excluido IS NULL OR a.excluido = false)")
    List<AgendaSemanal> findByProfissionalIdAndDiaSemana(
            @Param("profissionalId") Long profissionalId,
            @Param("diaSemana") Integer diaSemana
    );
}
