package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.PrecoProcedimento;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PrecoProcedimentoRepository extends BaseRepository<PrecoProcedimento> {
    @Query("SELECT p FROM PrecoProcedimento p WHERE p.procedimento.id = :procedimentoId AND p.convenio.id = :convenioId")
    Optional<PrecoProcedimento> findOneByProcedimentoAndConvenio(@Param("procedimentoId") Long procedimentoId,
            @Param("convenioId") Long convenioId);
}
