package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Agendamento;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AgendamentoRepository extends BaseRepository<Agendamento> {
    Page<Agendamento> findAllByProfissionalIdIs(Pageable pageable, Long profissionalId);
}
