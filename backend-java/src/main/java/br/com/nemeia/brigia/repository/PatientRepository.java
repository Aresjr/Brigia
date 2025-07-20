package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface PatientRepository extends JpaRepository<Patient, Integer> {

     Long countByIsDeleted(Boolean isDeleted);

     List<Patient> findAllByBirthDateIs(LocalDate date);
}
