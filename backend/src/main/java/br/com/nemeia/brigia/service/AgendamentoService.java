package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.mapper.AgendamentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class AgendamentoService extends BaseService<Agendamento, AgendamentoRepository> {

    private final AgendamentoMapper mapper;
    private final PacienteService pacienteService;
    private final ProfissionalService profissionalService;
    private final EspecialidadeService especialidadeService;
    private final ProcedimentoService procedimentoService;
    private final EmpresaService empresaService;

    public AgendamentoService(AgendamentoRepository repository, SecurityUtils securityUtils,
                              AgendamentoMapper mapper, PacienteService pacienteService,
                              ProfissionalService profissionalService, EspecialidadeService especialidadeService,
                              ProcedimentoService procedimentoService, EmpresaService empresaService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.especialidadeService = especialidadeService;
        this.procedimentoService = procedimentoService;
        this.empresaService = empresaService;
    }

    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);

        if (request.pacienteId() != null) {
            agendamento.setPaciente(pacienteService.getPacienteById(request.pacienteId()));
        }
        if (request.profissionalId() != null) {
            agendamento.setProfissional(profissionalService.getProfissionalById(request.profissionalId()));
        }
        if (request.especialidadeId() != null) {
            agendamento.setEspecialidade(especialidadeService.getById(request.especialidadeId()));
        }
        if (request.procedimentoId() != null) {
            agendamento.setProcedimento(procedimentoService.getById(request.procedimentoId()));
        }
        if (request.empresaId() != null) {
            agendamento.setEmpresa(empresaService.getById(request.empresaId()));
        }

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(new Unidade(securityUtils.getLoggedUserUnidadeId()));

        return repository.save(agendamento);
    }

    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        getById(id);
        Agendamento agendamento = mapper.toEntity(request);
        agendamento.setId(id);
        return repository.save(agendamento);
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
