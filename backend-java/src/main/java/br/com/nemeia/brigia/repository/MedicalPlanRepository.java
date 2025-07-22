package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Convenio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicalPlanRepository extends JpaRepository<Convenio, Long> {
}
