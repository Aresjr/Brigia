package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.ProcedimentoPlano;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProcedimentoPlanoRepository extends JpaRepository<ProcedimentoPlano, Long> {
    Optional<ProcedimentoPlano> findFirstByProcedimentoIdAndPlanoIdAndUnidadeId(Long procedimentoId, Long planoId,
            Long unidadeId);

    Optional<ProcedimentoPlano> findFirstByProcedimentoIdAndPlanoIdAndUnidadeIsNull(Long procedimentoId, Long planoId);
}
