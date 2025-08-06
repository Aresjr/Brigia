package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProfissionalMapper;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.ProfissionalRepository;
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
public class ProfissionalService {

  private final ProfissionalRepository repository;
  private final ProfissionalMapper mapper;

  public Page<Profissional> getPaged(int page, int size) {
    Sort sort = Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.DESC, "id"));
    Pageable pageable = PageRequest.of(page, size, sort);
    return repository.findAll(pageable);
  }

  public List<Profissional> getAniversariantes() {
    return repository.findAllByDataNascimentoIs(LocalDate.now());
  }

  public Profissional getProfissionalById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new NotFoundException("Profissional não encontrado com ID: " + id));
  }

  public Profissional createProfissional(ProfissionalRequest request) {
    Profissional profissional = mapper.toEntity(request);
    return saveProfissional(profissional);
  }

  private Profissional saveProfissional(Profissional profissional) {
    //TODO - setar as especialidades do profissional

    return repository.save(profissional);
  }

  public Profissional editProfissional(Long id, ProfissionalRequest request) {
    getProfissionalById(id);
    Profissional profissional = mapper.toEntity(request);
    profissional.setId(id);
    return saveProfissional(profissional);
  }
}
