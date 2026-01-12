package br.com.nemeia.brigia.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface BaseRepository<T> extends JpaRepository<T, Long> {
    Page<T> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
    Page<T> findAllByUnidadeIdIs(Pageable pageable, Long unidadeId);
    Page<T> findAll(Pageable pageable);
}
