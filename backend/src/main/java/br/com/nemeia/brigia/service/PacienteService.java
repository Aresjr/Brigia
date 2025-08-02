package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.response.PacienteRequest;
import br.com.nemeia.brigia.exception.PacienteNotFoundException;
import br.com.nemeia.brigia.mapper.PacienteMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.Paciente;
import br.com.nemeia.brigia.repository.PacienteRepository;
import java.time.LocalDate;
import java.util.List;
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
public class PacienteService {

  private final PacienteRepository repository;
  private final PacienteMapper mapper;
  private final ConvenioService convenioService;

  public Page<Paciente> getPaged(int page, int size) {
    Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
    return repository.findAll(pageable);
  }

  public long getTotal(Boolean excluido) {
    return repository.countByExcluido(excluido);
  }

  public List<Paciente> getAniversariantes() {
    return repository.findAllByDataNascimentoIs(LocalDate.now());
  }

  public Paciente getPacienteById(Long id) {
    return repository
        .findById(id)
        .orElseThrow(() -> new PacienteNotFoundException("Paciente não encontrado com ID: " + id));
  }

  public Paciente createPaciente(PacienteRequest request) {
    Paciente paciente = mapper.toEntity(request);
    return savePaciente(paciente, request.convenioId());
  }

  private Paciente savePaciente(Paciente paciente, Long idConvenio) {
    if(idConvenio != null) {
      Convenio convenio = convenioService.getById(idConvenio);
      paciente.setConvenio(convenio);
    }

    return repository.save(paciente);
  }

  public Paciente editPaciente(Long id, PacienteRequest request) {
    getPacienteById(id);
    Paciente paciente = mapper.toEntity(request);
    paciente.setId(id);
    return savePaciente(paciente, request.convenioId());
  }
}
