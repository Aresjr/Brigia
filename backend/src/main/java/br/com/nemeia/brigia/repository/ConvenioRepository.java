package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Convenio;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConvenioRepository extends JpaRepository<Convenio, Long> {
  Page<Convenio> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
