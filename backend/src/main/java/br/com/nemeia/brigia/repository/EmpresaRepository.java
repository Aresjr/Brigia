package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Empresa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
    Page<Empresa> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
