package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.ContaReceber;

import java.util.Optional;

public interface ContaReceberRepository extends BaseRepository<ContaReceber> {
    Optional<ContaReceber> findByAgendamentoId(Long agendamentoId);
}
