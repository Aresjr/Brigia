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
    private final ConvenioService convenioService;

    public AgendamentoService(AgendamentoRepository repository, SecurityUtils securityUtils,
                              AgendamentoMapper mapper, PacienteService pacienteService,
                              ProfissionalService profissionalService, EspecialidadeService especialidadeService,
                              ProcedimentoService procedimentoService, EmpresaService empresaService,
                              ConvenioService convenioService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.especialidadeService = especialidadeService;
        this.procedimentoService = procedimentoService;
        this.empresaService = empresaService;
        this.convenioService = convenioService;
    }

    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);
        setEntidades(request, agendamento);

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(new Unidade(securityUtils.getLoggedUserUnidadeId()));

        return repository.save(agendamento);
    }

    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        Agendamento original = getById(id);
        Agendamento agendamentoUpdate = mapper.toEntity(request);
        setEntidades(request, agendamentoUpdate);

        agendamentoUpdate.setId(id);
        agendamentoUpdate.setStatus(original.getStatus());
        agendamentoUpdate.setUnidade(original.getUnidade());
        return repository.save(agendamentoUpdate);
    }

    private void setEntidades(AgendamentoRequest request, Agendamento agendamento) {
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
        if (request.convenioId() != null) {
            agendamento.setConvenio(convenioService.getById(request.convenioId()));
        }
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
