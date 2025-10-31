package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.FilaEspera;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface FilaEsperaRepository extends BaseRepository<FilaEspera> {
    Page<FilaEspera> findAllByExcluidoIsFalseOrExcluidoIsNull(Pageable pageable);
}
