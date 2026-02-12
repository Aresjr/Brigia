package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Repasse;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RepasseRepository extends BaseRepository<Repasse> {

    @Query("SELECT r FROM Repasse r WHERE r.procedimento.id = :procedimentoId AND r.unidade.id = :unidadeId AND r.convenio.id = :convenioId AND r.profissional.id = :profissionalId")
    Optional<Repasse> findByProcedimentoAndUnidadeAndConvenioAndProfissional(
            @Param("procedimentoId") Long procedimentoId,
            @Param("unidadeId") Long unidadeId,
            @Param("convenioId") Long convenioId,
            @Param("profissionalId") Long profissionalId);

    @Query("SELECT r FROM Repasse r WHERE r.profissional.id = :profissionalId")
    List<Repasse> findByProfissional(@Param("profissionalId") Long profissionalId);

    @Query("SELECT r FROM Repasse r WHERE r.procedimento.id = :procedimentoId")
    List<Repasse> findByProcedimento(@Param("procedimentoId") Long procedimentoId);

    @Query("SELECT r FROM Repasse r WHERE r.unidade.id = :unidadeId")
    List<Repasse> findByUnidade(@Param("unidadeId") Long unidadeId);

    @Query("SELECT r FROM Repasse r WHERE r.convenio.id = :convenioId")
    List<Repasse> findByConvenio(@Param("convenioId") Long convenioId);
}

