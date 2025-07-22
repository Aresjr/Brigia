package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.MedicalPlanResponse;
import br.com.nemeia.brigia.exception.ConvenioNotFoundException;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.repository.ConvenioRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class MedicalPlanService {

    private final ConvenioRepository repository;
    private final ConvenioMapper mapper;

    public List<MedicalPlanResponse> getAll() {
        return mapper.toResponseList(repository.findAll());
    }

    public MedicalPlanResponse getById(Long id) {
        return repository.findById(id)
                .map(mapper::toResponse)
                .orElseThrow(() -> new ConvenioNotFoundException("Plano não encontrado com ID: " + id));
    }
}
