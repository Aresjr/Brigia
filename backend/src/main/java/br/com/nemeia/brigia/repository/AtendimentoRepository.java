package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.Atendimento;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AtendimentoRepository extends BaseRepository<Atendimento> {
    List<Atendimento> findAllByPacienteIdAndUnidadeId(Long pacienteId, Long unidadeId);
}
