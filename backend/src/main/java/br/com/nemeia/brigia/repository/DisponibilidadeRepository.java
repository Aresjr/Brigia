package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Disponibilidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface DisponibilidadeRepository extends BaseRepository<Disponibilidade> {
    Page<Disponibilidade> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
