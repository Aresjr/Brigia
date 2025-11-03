package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.FilaEsperaRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.FilaEsperaMapper;
import br.com.nemeia.brigia.model.*;
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
    private final ConvenioService convenioService;
    private final EmpresaService empresaService;
    private final ProfissionalService profissionalService;
    private final ProcedimentoService procedimentoService;

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
        return save(filaEspera, request);
    }

    private FilaEspera save(FilaEspera filaEspera, FilaEsperaRequest request) {
        Paciente paciente = pacienteService.getById(request.pacienteId());
        Especialidade especialidade = especialidadeService.getById(request.especialidadeId());

        filaEspera.setPaciente(paciente);
        filaEspera.setEspecialidade(especialidade);

        // Define os campos opcionais
        if (request.convenioId() != null) {
            Convenio convenio = convenioService.getById(request.convenioId());
            filaEspera.setConvenio(convenio);
        }

        if (request.empresaId() != null) {
            Empresa empresa = empresaService.getById(request.empresaId());
            filaEspera.setEmpresa(empresa);
        }

        if (request.profissionalId() != null) {
            Profissional profissional = profissionalService.getById(request.profissionalId());
            filaEspera.setProfissional(profissional);
        }

        if (request.procedimentoId() != null) {
            Procedimento procedimento = procedimentoService.getById(request.procedimentoId());
            filaEspera.setProcedimento(procedimento);
        }

        return repository.save(filaEspera);
    }

    public FilaEspera edit(Long id, FilaEsperaRequest request) {
        getById(id);
        FilaEspera filaEspera = mapper.toEntity(request);
        filaEspera.setId(id);
        return save(filaEspera, request);
    }

    public void delete(Long id) {
        FilaEspera filaEspera = getById(id);
        filaEspera.setExcluido(true);
        repository.save(filaEspera);
    }
}
