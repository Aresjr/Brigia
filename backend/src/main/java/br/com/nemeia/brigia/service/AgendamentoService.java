package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.exception.DisponibilidadeNaoEncontradaException;
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
import java.time.LocalTime;
import java.util.List;
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
    private final DisponibilidadeService disponibilidadeService;

    @Value("${app.base-url}")
    private String baseUrl;

    public AgendamentoService(AgendamentoRepository repository, AgendamentoMapper mapper,
            PacienteService pacienteService, ProfissionalService profissionalService,
            EspecialidadeService especialidadeService, ProcedimentoService procedimentoService,
            EmpresaService empresaService, ConvenioService convenioService, UnidadeService unidadeService,
            EmailService emailService, DisponibilidadeService disponibilidadeService) {
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
        this.disponibilidadeService = disponibilidadeService;
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

        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);

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

        // Validar disponibilidade do profissional, exceto se for encaixe
        validarDisponibilidadeProfissional(request, null);

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId()));
        Agendamento agendamentoNovo = repository.save(agendamento);

        sendEmail(agendamentoNovo, "Agendamento Realizado!", "agendamento-cadastrado");

        return agendamentoNovo;
    }

    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        Agendamento original = getById(id);
        boolean deveMandarEmail = deveMandarEmail(original, request); //TODO - verificar porque está mandando email na edição

        // Validar disponibilidade do profissional, exceto se for encaixe
        validarDisponibilidadeProfissional(request, id);

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
        agendamento.setProfissional(
                request.profissionalId() != null ? profissionalService.getById(request.profissionalId()) : null);
        agendamento.setEspecialidade(
                request.especialidadeId() != null ? especialidadeService.getById(request.especialidadeId()) : null);
        agendamento.setProcedimento(
                request.procedimentoId() != null ? procedimentoService.getById(request.procedimentoId()) : null);
        agendamento.setEmpresa(request.empresaId() != null ? empresaService.getById(request.empresaId()) : null);
        agendamento.setConvenio(request.convenioId() != null ? convenioService.getById(request.convenioId()) : null);
    }

    private void atualizaProximaConsultaPaciente(Paciente paciente, Agendamento agendamento) {
        paciente.setProximaConsulta(agendamento.getData().atTime(agendamento.getHora()));
        pacienteService.update(paciente);
    }

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

    private void validarDisponibilidadeProfissional(AgendamentoRequest request, Long agendamentoId) {
        // Se for encaixe, não precisa validar disponibilidade
        if (Boolean.TRUE.equals(request.encaixe())) {
            return;
        }

        // Validar se há disponibilidade cadastrada para o profissional no horário solicitado
        disponibilidadeService.findByProfissionalAndDiaAndHora(
                request.profissionalId(),
                request.data(),
                request.hora().plusMinutes(request.duracao())
        ).orElseThrow(() -> new DisponibilidadeNaoEncontradaException(
                "Não há disponibilidade cadastrada para o profissional no horário selecionado. " +
                "Troque o horário ou marque como encaixe."
        ));

        // Validar se não há conflito com outros agendamentos do mesmo profissional
        LocalTime horaFim = request.hora().plusMinutes(request.duracao());
        Long idParaVerificar = agendamentoId != null ? agendamentoId : -1L;

        List<Agendamento> agendamentosConflitantes = repository.findAgendamentosConflitantes(
                request.profissionalId(),
                request.data(),
                request.hora(),
                horaFim,
                idParaVerificar
        );

        if (!agendamentosConflitantes.isEmpty()) {
            throw new DisponibilidadeNaoEncontradaException(
                    "Já existe um agendamento para o profissional neste horário. " +
                    "Troque o horário ou marque como encaixe."
            );
        }
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
