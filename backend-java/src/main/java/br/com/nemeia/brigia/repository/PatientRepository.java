package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository extends JpaRepository<Patient, Integer> {


}
