package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.MedicalPlan;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicalPlanRepository extends JpaRepository<MedicalPlan, Integer> {
}
