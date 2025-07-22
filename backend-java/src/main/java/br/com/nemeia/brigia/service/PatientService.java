package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PacienteResponse;
import br.com.nemeia.brigia.exception.PatientNotFoundException;
import br.com.nemeia.brigia.mapper.PacienteMapper;
import br.com.nemeia.brigia.model.Paciente;
import br.com.nemeia.brigia.repository.PatientRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PatientService {

    private final PatientRepository repository;
    private final PacienteMapper mapper;

    public PagedResponse<PacienteResponse> getPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Paciente> result = repository.findAll(pageable);

        List<PacienteResponse> responses = mapper.toResponseList(result.getContent());
        log.info("Retornando {} pacientes da página {} com tamanho {}", responses.size(), page, size);

        return new PagedResponse<>(
                responses,
                result.getNumber(),
                result.getTotalPages(),
                result.getTotalElements()
        );
    }

    public long getTotal(Boolean isDeleted) {
        return repository.countByIsDeleted(isDeleted);
    }

    public List<PacienteResponse> getBirthdayPatients() {
        return repository.findAllByBirthDateIs(LocalDate.now())
                .stream().map(mapper::toResponse).toList();
    }

    public PacienteResponse getPatientById(Long id) {
        return repository.findById(id)
                .map(mapper::toResponse)
                .orElseThrow(() -> new PatientNotFoundException("Paciente não encontrado com ID: " + id));
    }
}
