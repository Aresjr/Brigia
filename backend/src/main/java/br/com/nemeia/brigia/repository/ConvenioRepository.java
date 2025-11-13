package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Convenio;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ConvenioRepository extends BaseRepository<Convenio> {
    Page<Convenio> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);

    Optional<Convenio> findFirstByParticularTrue();

    @Modifying
    @Query("UPDATE Convenio c SET c.particular = false WHERE (:id IS NULL OR c.id <> :id)")
    void clearParticularExcept(@Param("id") Long id);
}
