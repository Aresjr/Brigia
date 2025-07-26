package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Procedimento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProcedimentoRepository extends JpaRepository<Procedimento, Long> {
}
