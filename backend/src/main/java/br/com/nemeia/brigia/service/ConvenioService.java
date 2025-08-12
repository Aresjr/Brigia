package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.ConvenioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.repository.ConvenioRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ConvenioService {

  private final ConvenioRepository repository;
  private final ConvenioMapper mapper;
  private final SecurityUtils securityUtils;

  public Page<Convenio> getPaged(int page, int size, Boolean mostrarExcluidos) {
    Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);
    return mostrarExcluidos
        ? repository.findAll(pageable)
        : repository.findAllByExcluidoIsOrExcluidoIsNull(pageable, false);
  }

  public Convenio getById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new NotFoundException("Convênio não encontrado com ID: " + id));
  }

  public Convenio createConvenio(ConvenioRequest request) {
    Convenio convenio = mapper.toEntity(request);
    return repository.save(convenio);
  }

  public Convenio editConvenio(Long id, ConvenioRequest request) {
    getById(id);
    Convenio convenio = mapper.toEntity(request);
    convenio.setId(id);
    return repository.save(convenio);
  }

  public void deleteConvenio(Long id) {
    Convenio convenio = getById(id);
    convenio.setExcluido(true);
    convenio.setExcluidoEm(LocalDateTime.now());

    Long userId = securityUtils.getLoggedUser();
    convenio.setExcluidoPor(userId);
    repository.save(convenio);
  }

  public void restoreConvenio(Long id) {
    Convenio convenio = getById(id);
    convenio.setExcluido(false);
    convenio.setExcluidoEm(null);
    convenio.setExcluidoPor(null);
    repository.save(convenio);
  }
}
