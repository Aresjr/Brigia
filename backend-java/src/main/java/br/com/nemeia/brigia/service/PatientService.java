package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.mapper.PatientMapper;
import br.com.nemeia.brigia.model.Patient;
import br.com.nemeia.brigia.repository.PatientRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PatientService {

    private final PatientRepository repository;
    private final PatientMapper mapper;

    public PagedResponse<PatientResponse> getAll(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<Patient> result = repository.findAll(pageable);

        List<PatientResponse> responses = mapper.toResponseList(result.getContent());
        log.info("Retornando {} pacientes da página {} com tamanho {}", responses.size(), page, size);

        return new PagedResponse<>(
                responses,
                result.getNumber(),
                result.getTotalPages(),
                result.getTotalElements()
        );
    }

    public long count() {
        return repository.findAll().size();
    }
}
