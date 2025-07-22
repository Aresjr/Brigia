package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.MedicalPlanResponse;
import br.com.nemeia.brigia.exception.MedicalPlanNotFoundException;
import br.com.nemeia.brigia.mapper.MedicalPlanMapper;
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
    private final MedicalPlanMapper mapper;

    public List<MedicalPlanResponse> getAll() {
        return mapper.toResponseList(repository.findAll());
    }

    public MedicalPlanResponse getById(Integer id) {
        return repository.findById(id)
                .map(mapper::toResponse)
                .orElseThrow(() -> new MedicalPlanNotFoundException("Plano não encontrado com ID: " + id));
    }
}
