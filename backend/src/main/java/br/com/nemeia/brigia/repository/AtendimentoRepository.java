package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Atendimento;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface AtendimentoRepository extends BaseRepository<Atendimento> {
    Page<Atendimento> findByExcluido(boolean excluido, Pageable pageable);
}
