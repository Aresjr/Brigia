package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Profissional;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface ProfissionalRepository extends JpaRepository<Profissional, Long> {
    List<Profissional> findAllByDataNascimentoIs(LocalDate now);
}
