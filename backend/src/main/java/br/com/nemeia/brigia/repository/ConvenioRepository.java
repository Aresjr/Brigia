package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Convenio;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ConvenioRepository extends BaseRepository<Convenio> {
    Page<Convenio> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
