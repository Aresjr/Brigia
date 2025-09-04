package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Empresa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface EmpresaRepository extends BaseRepository<Empresa> {
    Page<Empresa> findAllByExcluidoIsOrExcluidoIsNull(Pageable pageable, Boolean excluido);
}
