package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Profissional;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfissionalRepository extends JpaRepository<Profissional, Long> {
  List<Profissional> findAllByDataNascimentoIs(LocalDate now);
}
