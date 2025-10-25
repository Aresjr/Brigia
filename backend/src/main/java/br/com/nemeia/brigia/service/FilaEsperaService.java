package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.FilaEsperaRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.FilaEsperaMapper;
import br.com.nemeia.brigia.model.Especialidade;
import br.com.nemeia.brigia.model.FilaEspera;
import br.com.nemeia.brigia.model.Paciente;
import br.com.nemeia.brigia.repository.FilaEsperaRepository;
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
public class FilaEsperaService {

    private final FilaEsperaRepository repository;
    private final FilaEsperaMapper mapper;
    private final PacienteService pacienteService;
    private final EspecialidadeService especialidadeService;

    public Page<FilaEspera> getPaged(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.ASC, "excluido").and(Sort.by(Sort.Direction.ASC, "criadoEm"));
        Pageable pageable = PageRequest.of(page, size, sort);
        return repository.findAllByExcluidoIsFalseOrExcluidoIsNull(pageable);
    }

    public FilaEspera getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Registro de fila de espera não encontrado com ID: " + id));
    }

    public FilaEspera create(FilaEsperaRequest request) {
        FilaEspera filaEspera = mapper.toEntity(request);
        return save(filaEspera, request.pacienteId(), request.especialidadeId());
    }

    private FilaEspera save(FilaEspera filaEspera, Long pacienteId, Long especialidadeId) {
        Paciente paciente = pacienteService.getById(pacienteId);
        Especialidade especialidade = especialidadeService.getById(especialidadeId);

        filaEspera.setPaciente(paciente);
        filaEspera.setEspecialidade(especialidade);

        return repository.save(filaEspera);
    }

    public FilaEspera edit(Long id, FilaEsperaRequest request) {
        getById(id);
        FilaEspera filaEspera = mapper.toEntity(request);
        filaEspera.setId(id);
        return save(filaEspera, request.pacienteId(), request.especialidadeId());
    }

    public void delete(Long id) {
        FilaEspera filaEspera = getById(id);
        filaEspera.setExcluido(true);
        repository.save(filaEspera);
    }
}
