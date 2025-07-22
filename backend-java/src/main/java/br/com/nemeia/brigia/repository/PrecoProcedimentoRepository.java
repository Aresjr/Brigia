package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.ProcedimentoConvenioId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrecoProcedimentoRepository extends JpaRepository<PrecoProcedimento, ProcedimentoConvenioId> {
}
