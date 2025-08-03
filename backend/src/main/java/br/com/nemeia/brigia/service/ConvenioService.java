package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.response.ConvenioRequest;
import br.com.nemeia.brigia.exception.ConvenioNotFoundException;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.repository.ConvenioRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ConvenioService {

  private final ConvenioRepository repository;
  private final ConvenioMapper mapper;

  public Page<Convenio> getPaged(int page, int size) {
    Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
    return repository.findAll(pageable);
  }

  public Convenio getById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new ConvenioNotFoundException("Plano não encontrado com ID: " + id));
  }

  public Convenio createConvenio(ConvenioRequest request) {
    Convenio convenio = mapper.toEntity(request);
    return repository.save(convenio);
  }

  public Convenio editConvenio(Long id, @Valid ConvenioRequest request) {
    getById(id);
    Convenio convenio = mapper.toEntity(request);
    convenio.setId(id);
    return repository.save(convenio);
  }
}
