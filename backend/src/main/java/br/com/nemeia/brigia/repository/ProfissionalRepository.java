package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Profissional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ProfissionalRepository extends BaseRepository<Profissional> {
    List<Profissional> findAllByDataNascimentoIs(LocalDate now);

    Optional<Profissional> findOneByUsuarioIdIs(Long usuarioId);

    Optional<Profissional> findAllByUnidadeIdIsAndExcluidoIsNotNull(Long usuarioId);
}
