package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.response.ConvenioResponse;
import br.com.nemeia.brigia.exception.ConvenioNotFoundException;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.repository.ConvenioRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ConvenioService {

  private final ConvenioRepository repository;
  private final ConvenioMapper mapper;

  public List<ConvenioResponse> getAll() {
    return mapper.toResponseList(repository.findAll());
  }

  public ConvenioResponse getById(Long id) {
    return repository
        .findById(id)
        .map(mapper::toResponse)
        .orElseThrow(() -> new ConvenioNotFoundException("Plano não encontrado com ID: " + id));
  }
}
