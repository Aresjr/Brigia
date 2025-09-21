package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.AgendamentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Map;
import java.util.Objects;

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
    private final UnidadeService unidadeService;
    private final EmailService emailService;

    @Value("${app.base-url}")
    private String baseUrl;

    public AgendamentoService(AgendamentoRepository repository, AgendamentoMapper mapper,
            PacienteService pacienteService, ProfissionalService profissionalService,
            EspecialidadeService especialidadeService, ProcedimentoService procedimentoService,
            EmpresaService empresaService, ConvenioService convenioService, UnidadeService unidadeService,
            EmailService emailService) {
        super(repository);
        this.mapper = mapper;
        this.pacienteService = pacienteService;
        this.profissionalService = profissionalService;
        this.especialidadeService = especialidadeService;
        this.procedimentoService = procedimentoService;
        this.empresaService = empresaService;
        this.convenioService = convenioService;
        this.emailService = emailService;
        this.unidadeService = unidadeService;
    }

    @Cacheable(value = "agendamentos", key = "#userId + '-' + #mes + '-' + #ano")
    public Page<Agendamento> getByDate(Long userId, Integer mes, Integer ano, int page, int size) {
        if (mes == null) {
            mes = LocalDate.now().getMonthValue();
        }
        if (ano == null) {
            ano = LocalDate.now().getYear();
        }
        LocalDate startDate = LocalDate.of(ano, mes, 1).minusMonths(1);
        LocalDate endDate = LocalDate.of(ano, mes, 1).plusMonths(2).minusDays(1);

        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);

        if (SecurityHolder.getLoggedUserRoles().contains(RoleUsuario.MEDICO.toString())) {
            Long profissionalId = profissionalService.getByUsuarioId(userId).getId();
            return repository.findAllByProfissionalIdAndDateRange(pageable, profissionalId, startDate, endDate);
        } else {
            return repository.findAllByDate(pageable, SecurityHolder.getLoggedUserUnidadeId(), startDate, endDate);
        }
    }

    @Transactional
    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);
        setEntidades(request, agendamento);
        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId()));
        Agendamento agendamentoNovo = repository.save(agendamento);

        sendEmail(agendamentoNovo, "Agendamento Realizado!", "agendamento-cadastrado");

        return agendamentoNovo;
    }

    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        Agendamento original = getById(id);
        boolean deveMandarEmail = deveMandarEmail(original, request);

        Agendamento agendamentoUpdate = mapper.updateEntity(original, request);
        setEntidades(request, agendamentoUpdate);
        Agendamento agendamentoAtualizado = repository.save(agendamentoUpdate);

        if (deveMandarEmail) {
            sendEmail(agendamentoAtualizado, "Agendamento Atualizado!", "agendamento-atualizado");
        }

        return agendamentoAtualizado;
    }

    private void setEntidades(AgendamentoRequest request, Agendamento agendamento) {
        if (request.pacienteId() != null) {
            Paciente paciente = pacienteService.getById(request.pacienteId());
            atualizaProximaConsultaPaciente(paciente, agendamento);
            agendamento.setPaciente(paciente);
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

    private void atualizaProximaConsultaPaciente(Paciente paciente, Agendamento agendamento) {
        paciente.setProximaConsulta(agendamento.getData().atTime(agendamento.getHora()));
        pacienteService.update(paciente);
    }

    @Async
    @CacheEvict(value = "agendamentos", allEntries = true)
    public void updateStatus(Agendamento agendamento, StatusAgendamento statusAgendamento) {
        agendamento.setStatus(statusAgendamento);
        repository.save(agendamento);
    }

    @Async
    private void sendEmail(Agendamento agendamento, String status, String template) {
        var email = agendamento.getPaciente().getEmail();
        if (email != null) {
            Map<String, Object> variables = getVariaveisEmail(agendamento);
            try {
                emailService.sendEmail(email, status, template, variables);
            } catch (Exception e) {
                log.error("Não foi possível enviar email: {}", e.getLocalizedMessage());
            }
        }
    }

    private Map<String, Object> getVariaveisEmail(Agendamento agendamento) {
        var linkConfirmacao = String.format("%s/detalhes-agendamento?token=%s", baseUrl, agendamento.getTokenPublico());
        return Map.of("nomePaciente", agendamento.getPaciente().getNome(), "data", agendamento.getData(), "horario",
                agendamento.getHora(), "nomeMedico", agendamento.getProfissional().getNome(), "linkConfirmacao",
                linkConfirmacao, "clinica", agendamento.getUnidade().getNome());
    }

    private boolean deveMandarEmail(Agendamento original, AgendamentoRequest request) {
        return original.getHora() != request.hora() || original.getData() != request.data()
                || !Objects.equals(original.getProfissional().getId(), request.profissionalId());
    }

    public Agendamento getByToken(String token) {
        return repository.findOneByToken(token)
                .orElseThrow(() -> new NotFoundException(getNomeEntidade() + " não encontrado com token:" + token));
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
