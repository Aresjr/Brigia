package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Paciente;
import java.time.LocalDate;
import java.util.List;

public interface PacienteRepository extends BaseRepository<Paciente> {
    Long countByExcluido(Boolean excluido);

    List<Paciente> findAllByDataNascimentoIs(LocalDate date);
}
