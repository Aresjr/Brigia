package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Paciente;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PacienteRepository extends JpaRepository<Paciente, Long> {

  Long countByExcluido(Boolean excluido);

  List<Paciente> findAllByDataNascimentoIs(LocalDate date);
}
