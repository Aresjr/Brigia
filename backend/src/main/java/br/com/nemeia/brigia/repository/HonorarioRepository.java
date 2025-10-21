package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Honorario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Optional;

public interface HonorarioRepository extends BaseRepository<Honorario> {

    @Query("SELECT h FROM Honorario h WHERE h.profissional.id = :profissionalId " +
           "AND h.data = :data AND (h.excluido IS NULL OR h.excluido = false)")
    Optional<Honorario> findByProfissionalAndData(@Param("profissionalId") Long profissionalId,
                                                    @Param("data") LocalDate data);
}
