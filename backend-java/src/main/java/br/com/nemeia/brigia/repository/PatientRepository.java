package br.com.nemeia.brigia.repository;


import br.com.nemeia.brigia.model.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface PatientRepository extends JpaRepository<Paciente, Integer> {

     Long countByIsDeleted(Boolean isDeleted);

     List<Paciente> findAllByBirthDateIs(LocalDate date);
}
