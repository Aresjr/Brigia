package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
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

    public AgendamentoService(AgendamentoRepository repository, SecurityUtils securityUtils, AgendamentoMapper mapper,
            PacienteService pacienteService, ProfissionalService profissionalService,
            EspecialidadeService especialidadeService, ProcedimentoService procedimentoService,
            EmpresaService empresaService, ConvenioService convenioService, UnidadeService unidadeService,
                              EmailService emailService) {
        super(repository, securityUtils);
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

    @Transactional
    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);
        setEntidades(request, agendamento);
        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(unidadeService.getById(securityUtils.getLoggedUserUnidadeId()));

        Agendamento agendamentoNovo = repository.save(agendamento);

        sendEmail(agendamentoNovo, "Agendamento Realizado!", "agendamento-cadastrado");

        return agendamentoNovo;
    }

    @CacheEvict(value = "agendamentos", allEntries = true)
    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        Agendamento original = getById(id);
        Boolean deveMandarEmail = deveMandarEmail(original, request);

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
    public void updateStatus(Agendamento agendamento, StatusAgendamento statusAgendamento) {
      agendamento.setStatus(statusAgendamento);
      repository.save(agendamento);
    }

    private void sendEmail(Agendamento agendamento, String status, String template) {
      var email = agendamento.getPaciente().getEmail();
      if (email != null) {
        var linkConfirmacao = String.format("%s/detalhes-agendamento?token=%s", baseUrl, agendamento.getTokenPublico());
        Map<String, Object> variables = Map.of(
          "nomePaciente", agendamento.getPaciente().getNome(),
          "data", agendamento.getData(),
          "horario", agendamento.getHora(),
          "nomeMedico", agendamento.getProfissional().getNome(),
          "linkConfirmacao", linkConfirmacao,
          "clinica", agendamento.getUnidade().getNome()
        );
        try {
          emailService.sendEmail(email, status, template, variables);
        } catch (Exception e) {
          log.error("Não foi possível enviar email: {}", e.getLocalizedMessage());
        }
      }
    }

    private boolean deveMandarEmail(Agendamento original, AgendamentoRequest request) {
      return original.getHora() != request.hora()
        || original.getData() != request.data()
        || !Objects.equals(original.getProfissional().getId(), request.profissionalId());
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
