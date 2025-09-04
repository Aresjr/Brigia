package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.atendimento.AtendimentoRequest;
import br.com.nemeia.brigia.mapper.AtendimentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AtendimentoService extends BaseService<Atendimento, AtendimentoRepository> {

    private final PacienteService pacienteService;
    private final ProfissionalService profissionalService;
    private final AgendamentoService agendamentoService;
    private final ConvenioService convenioService;
    private final EmpresaService empresaService;
    private final EspecialidadeService especialidadeService;
    private final AtendimentoMapper mapper;

    public AtendimentoService(
            AtendimentoRepository repository,
            SecurityUtils securityUtils,
            AtendimentoMapper mapper,
            PacienteService pacienteService,
            ProfissionalService profissionalService,
            AgendamentoService agendamentoService,
            EspecialidadeService especialidadeService,
            EmpresaService empresaService,
            ConvenioService convenioService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.agendamentoService = agendamentoService;
        this.especialidadeService = especialidadeService;
        this.empresaService = empresaService;
        this.convenioService = convenioService;
    }

    public Page<Atendimento> getPaged(int page, int size, boolean mostrarExcluidos) {
        return repository.findByExcluido(mostrarExcluidos, PageRequest.of(page, size));
    }

    @Transactional
    public Atendimento createAtendimento(AtendimentoRequest request) {
        Atendimento atendimento = mapper.toEntity(request);

        atendimento.setPaciente(pacienteService.getById(request.pacienteId()));
        atendimento.setUnidade(new Unidade(securityUtils.getLoggedUserUnidadeId()));
        atendimento.setProfissional(
                profissionalService.getByUsuarioId(securityUtils.getLoggedUserId()));

        setEntidades(request, atendimento);

        return repository.save(atendimento);
    }

    public Atendimento update(@Valid AtendimentoRequest request, Long id) {
        Atendimento original = getById(id);
        Atendimento atendimentoUpdate = mapper.toEntity(request);
        setEntidades(request, atendimentoUpdate);

        atendimentoUpdate.setId(original.getId());
        atendimentoUpdate.setUnidade(original.getUnidade());
        atendimentoUpdate.setPaciente(original.getPaciente());
        atendimentoUpdate.setProfissional(original.getProfissional());
        atendimentoUpdate.setAgendamento(original.getAgendamento());
        return repository.save(atendimentoUpdate);
    }

    private void setEntidades(AtendimentoRequest request, Atendimento atendimento) {
        if (request.agendamentoId() != null) {
            atendimento.setAgendamento(agendamentoService.getById(request.agendamentoId()));
        }
        if (request.convenioId() != null) {
            atendimento.setConvenio(convenioService.getById(request.convenioId()));
        }
        if (request.empresaId() != null) {
            atendimento.setEmpresa(empresaService.getById(request.empresaId()));
        }
        if (request.especialidadeId() != null) {
            atendimento.setEspecialidade(especialidadeService.getById(request.especialidadeId()));
        }
    }

    @Override
    String getNomeEntidade() {
        return "Atendimento";
    }
}
