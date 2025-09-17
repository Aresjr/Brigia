package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.mapper.AgendamentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

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

    public AgendamentoService(AgendamentoRepository repository, SecurityUtils securityUtils, AgendamentoMapper mapper,
            PacienteService pacienteService, ProfissionalService profissionalService,
            EspecialidadeService especialidadeService, ProcedimentoService procedimentoService,
            EmpresaService empresaService, ConvenioService convenioService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.especialidadeService = especialidadeService;
        this.procedimentoService = procedimentoService;
        this.empresaService = empresaService;
        this.convenioService = convenioService;
    }

    @Cacheable(value = "agendamentos", key = "#mes + '-' + #ano + '-' + #userId")
    public Page<Agendamento> getByDate(Long userId, Integer mes, Integer ano, int page, int size) {
        if (mes == null) {
            mes = LocalDate.now().getMonthValue();
        }
        if (ano == null) {
            ano = LocalDate.now().getYear();
        }

        LocalDate startDate = LocalDate.of(ano, mes, 1)
            .minusMonths(1);

        LocalDate endDate = LocalDate.of(ano, mes, 1)
            .plusMonths(2)
            .minusDays(1);

        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);

        if (securityUtils.getLoggedUserRoles().contains(RoleUsuario.MEDICO.toString())) {
            Long profissionalId = profissionalService.getByUsuarioId(userId).getId();
            return repository.findAllByProfissionalIdAndDateRange(pageable, profissionalId, startDate, endDate);
        } else {
            return repository.findAllByDateRange(pageable, startDate, endDate);
        }
    }

    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);
        setEntidades(request, agendamento);

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(new Unidade(securityUtils.getLoggedUserUnidadeId()));

        return repository.save(agendamento);
    }

    @CacheEvict(value = "agendamentos", allEntries = true)
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
            agendamento.setPaciente(pacienteService.getById(request.pacienteId()));
        }
        if (request.profissionalId() != null) {
            agendamento.setProfissional(profissionalService.getById(request.profissionalId()));
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

    @CacheEvict(value = "agendamentos", allEntries = true)
    public void update(Agendamento agendamento) {
      repository.save(agendamento);
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
