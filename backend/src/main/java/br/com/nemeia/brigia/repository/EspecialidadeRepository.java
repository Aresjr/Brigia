package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Especialidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EspecialidadeRepository extends JpaRepository<Especialidade, Long> {
    Page<Especialidade> findAllByExcluidoIs(Pageable pageable, Boolean excluido);
}
