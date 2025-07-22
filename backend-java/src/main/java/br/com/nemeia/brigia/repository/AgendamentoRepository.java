package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Agendamento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AgendamentoRepository extends JpaRepository<Agendamento, Long> {
}
