package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProcedimentoMapper;
import br.com.nemeia.brigia.model.Procedimento;
import br.com.nemeia.brigia.repository.ProcedimentoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProcedimentoService {

  private final ProcedimentoRepository repository;
  private final ProcedimentoMapper mapper;
  private final SecurityUtils securityUtils;
  private final EspecialidadeService especialidadeService;

  public Page<Procedimento> getPaged(int page, int size) {
    Sort sort = Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.DESC, "id")); //TODO - centralizar
    Pageable pageable = PageRequest.of(page, size, sort);
    return repository.findAll(pageable);
  }

  public Procedimento getById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new NotFoundException("Procedimento não encontrado com ID: " + id));
  }

  public Procedimento createProcedimento(ProcedimentoRequest request) {
    //TODO - buscar Especialidade antes de salvar


    Procedimento procedimento = mapper.toEntity(request);
    return repository.save(procedimento);
  }

  public Procedimento editProcedimento(Long id, ProcedimentoRequest request) {
    getById(id);
    Procedimento procedimento = mapper.toEntity(request);
    procedimento.setId(id);
    return repository.save(procedimento);
  }

  public void deleteProcedimento(Long id) {
    Procedimento procedimento = getById(id);
    procedimento.setExcluido(true);
    procedimento.setExcluidoEm(LocalDateTime.now());

    Long userId = securityUtils.getLoggedUser();
    procedimento.setExcluidoPor(userId);
    repository.save(procedimento);
  }

  public void restoreProcedimento(Long id) {
    Procedimento procedimento = getById(id);
    procedimento.setExcluido(false);
    procedimento.setExcluidoEm(null);
    procedimento.setExcluidoPor(null);
    repository.save(procedimento);
  }
}
