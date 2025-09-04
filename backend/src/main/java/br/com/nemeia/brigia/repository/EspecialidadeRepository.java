package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Especialidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface EspecialidadeRepository extends BaseRepository<Especialidade> {
    Page<Especialidade> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
