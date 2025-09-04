package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.PacienteMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.Empresa;
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
    private final EmpresaService empresaService;

    public Page<Paciente> getPaged(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.DESC, "id"));
        Pageable pageable = PageRequest.of(page, size, sort);
        return repository.findAll(pageable);
    }

    public long getTotal(Boolean excluido) {
        return repository.countByExcluido(excluido);
    }

    public List<Paciente> getAniversariantes() {
        return repository.findAllByDataNascimentoIs(LocalDate.now());
    }

    public Paciente getById(Long id) {
        return repository
                .findById(id)
                .orElseThrow(() -> new NotFoundException("Paciente não encontrado com ID: " + id));
    }

    public Paciente createPaciente(PacienteRequest request) {
        Paciente paciente = mapper.toEntity(request);
        return savePaciente(paciente, request.convenioId(), request.empresaId());
    }

    private Paciente savePaciente(Paciente paciente, Long idConvenio, Long idEmpresa) {
        if (idConvenio != null) {
            Convenio convenio = convenioService.getById(idConvenio);
            paciente.setConvenio(convenio);
        }
        if (idEmpresa != null) {
            Empresa empresa = empresaService.getById(idEmpresa);
            paciente.setEmpresa(empresa);
        }
        return repository.save(paciente);
    }

    public Paciente editPaciente(Long id, PacienteRequest request) {
        getById(id);
        Paciente paciente = mapper.toEntity(request);
        paciente.setId(id);
        return savePaciente(paciente, request.convenioId(), request.empresaId());
    }
}
