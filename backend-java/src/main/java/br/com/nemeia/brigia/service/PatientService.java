package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.mapper.PatientMapper;
import br.com.nemeia.brigia.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PatientService {

    private final PatientRepository patientRepository;
    private final PatientMapper patientMapper;

    @Autowired
    public PatientService(PatientRepository patientRepository, PatientMapper patientMapper) {
        this.patientRepository = patientRepository;
        this.patientMapper = patientMapper;
    }

    public List<PatientResponse> findAllPatients() {
        return patientRepository.findAll()
                .stream()
                .map(patientMapper::toResponse)
                .collect(Collectors.toList());
    }
}
