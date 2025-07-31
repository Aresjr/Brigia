package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.ConvenioNotFoundException;
import br.com.nemeia.brigia.model.Convenio;
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

  public List<Convenio> getAll() {
    return repository.findAll();
  }

  public Convenio getById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new ConvenioNotFoundException("Plano não encontrado com ID: " + id));
  }
}
