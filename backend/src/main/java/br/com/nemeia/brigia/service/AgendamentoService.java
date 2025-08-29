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

    public AgendamentoService(AgendamentoRepository repository, SecurityUtils securityUtils,
                              AgendamentoMapper mapper, PacienteService pacienteService,
                              ProfissionalService profissionalService, EspecialidadeService especialidadeService,
                              ProcedimentoService procedimentoService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.especialidadeService = especialidadeService;
        this.procedimentoService = procedimentoService;
    }

    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);

        if (request.pacienteId() != null) {
            Paciente paciente = pacienteService.getPacienteById(request.pacienteId());
            agendamento.setPaciente(paciente);
        }
        if (request.profissionalId() != null) {
            Profissional profissional = profissionalService.getProfissionalById(request.profissionalId());
            agendamento.setProfissional(profissional);
        }
        if (request.especialidadeId() != null) {
            Especialidade especialidade = especialidadeService.getById(request.especialidadeId());
            agendamento.setEspecialidade(especialidade);
        }
        if (request.procedimentoId() != null) {
            Procedimento procedimento = procedimentoService.getById(request.procedimentoId());
            agendamento.setProcedimento(procedimento);
        }

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        Long unidadeId = securityUtils.getLoggedUserUnidadeId();
        agendamento.setUnidade(new Unidade(unidadeId));

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
