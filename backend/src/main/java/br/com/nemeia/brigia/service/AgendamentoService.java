package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.dto.request.ProcedimentoAgendamentoRequest;
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

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
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
    private final AgendaSemanalService agendaSemanalService;
    private final ContaReceberService contaReceberService;
    private final ProcedimentoPrecoResolver procedimentoPrecoResolver;

    @Value("${app.base-url}")
    private String baseUrl;

    public AgendamentoService(AgendamentoRepository repository, AgendamentoMapper mapper,
            PacienteService pacienteService, ProfissionalService profissionalService,
            EspecialidadeService especialidadeService, ProcedimentoService procedimentoService,
            EmpresaService empresaService, ConvenioService convenioService, UnidadeService unidadeService,
            EmailService emailService, DisponibilidadeService disponibilidadeService,
            AgendaSemanalService agendaSemanalService, ContaReceberService contaReceberService,
            ProcedimentoPrecoResolver procedimentoPrecoResolver) {
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
        this.agendaSemanalService = agendaSemanalService;
        this.contaReceberService = contaReceberService;
        this.procedimentoPrecoResolver = procedimentoPrecoResolver;
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
    @CacheEvict(value = {"agendamentos"}, allEntries = true)
    public Agendamento createAgendamento(AgendamentoRequest request) {
        Agendamento agendamento = mapper.toEntity(request);
        setEntidades(request, agendamento);

        // Validar disponibilidade do profissional, exceto se for encaixe
        validarDisponibilidadeProfissional(request, null);

        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setUnidade(unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId()));

        // Salvar agendamento primeiro para obter o ID
        var listaProcedimentos = request.procedimentos();
        agendamento.setProcedimentos(null);
        Agendamento agendamentoNovo = repository.save(agendamento);

        // Processar lista de procedimentos após o agendamento ter sido salvo
        if (listaProcedimentos != null && !listaProcedimentos.isEmpty()) {
            processarProcedimentos(agendamentoNovo, listaProcedimentos);
            // Salvar novamente para persistir os procedimentos
            agendamentoNovo = repository.save(agendamentoNovo);
        }

        contaReceberService.createContaReceberFromAgendamento(agendamentoNovo);

        sendEmail(agendamentoNovo, "Agendamento Realizado!", "agendamento-cadastrado");

        return agendamentoNovo;
    }

    @CacheEvict(value = {"agendamentos"}, allEntries = true)
    public Agendamento editAgendamento(Long id, AgendamentoRequest request) {
        Agendamento original = getById(id);
        boolean deveMandarEmail = deveMandarEmail(original, request);

        // Verificar se houve mudança no profissional, data ou hora
        boolean horarioMudou = !original.getData().equals(request.data()) || !original.getHora().equals(request.hora())
                || !original.getProfissional().getId().equals(request.profissionalId());

        // Validar disponibilidade do profissional apenas se o horário mudou
        if (horarioMudou) {
            validarDisponibilidadeProfissional(request, id);
        }

        Agendamento agendamentoUpdate = mapper.updateEntity(original, request);
        setEntidades(request, agendamentoUpdate);

        // Remover procedimentos antigos e adicionar novos
        agendamentoUpdate.getProcedimentos().clear();
        if (request.procedimentos() != null && !request.procedimentos().isEmpty()) {
            processarProcedimentos(agendamentoUpdate, request.procedimentos());
        }

        Agendamento agendamentoAtualizado = repository.save(agendamentoUpdate);

        // Sincronizar Conta a Receber com lógica dos 3 cenários
        contaReceberService.sincronizarContaReceberComAgendamento(id, agendamentoAtualizado, request.pago(),
                request.quantiaPaga());

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
        //email = "aresnemeia@gmail.com";
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

    @Transactional
    @CacheEvict(value = {"agendamentos"}, allEntries = true)
    public void cancelarPorToken(String token) {
        Agendamento agendamento = getByToken(token);
        
        // Verificar se o agendamento já foi cancelado ou finalizado
        if (agendamento.getStatus() == StatusAgendamento.CANCELADO 
                || agendamento.getStatus() == StatusAgendamento.CANCELADO_USUARIO
                || agendamento.getStatus() == StatusAgendamento.FINALIZADO) {
            throw new IllegalStateException("Este agendamento não pode mais ser cancelado.");
        }
        
        // Atualizar status para CANCELADO_USUARIO
        agendamento.setStatus(StatusAgendamento.CANCELADO_USUARIO);
        repository.save(agendamento);
        
        // Atualizar ou cancelar a conta a receber associada
        contaReceberService.deleteContaReceberByAgendamento(agendamento.getId());
    }

    private void validarDisponibilidadeProfissional(AgendamentoRequest request, Long agendamentoId) {
        // SEMPRE validar conflito de horário, independente de ser encaixe ou não
        LocalTime horaFim = request.hora().plusMinutes(request.duracao());
        Long idParaVerificar = agendamentoId != null ? agendamentoId : -1L;

        List<Agendamento> agendamentosConflitantes = repository.findAgendamentosConflitantes(request.profissionalId(),
                request.data(), request.hora(), horaFim, idParaVerificar);

        if (!agendamentosConflitantes.isEmpty()) {
            throw new DisponibilidadeNaoEncontradaException(
                    "Já existe um agendamento para o profissional neste horário. Escolha outro horário.");
        }

        // Se for encaixe, não precisa validar disponibilidade (pode agendar fora do
        // horário de trabalho)
        if (Boolean.TRUE.equals(request.encaixe())) {
            return;
        }

        // Se não for encaixe, validar se há disponibilidade cadastrada para o
        // profissional no horário solicitado
        // Primeiro verifica na disponibilidade específica (data específica)
        boolean temDisponibilidadeEspecifica = disponibilidadeService.findByProfissionalAndDiaAndHora(
                request.profissionalId(), request.data(), request.hora().plusMinutes(request.duracao())).isPresent();

        // Se não encontrou disponibilidade específica, verifica na agenda semanal
        // (recorrente)
        boolean temAgendaSemanal = agendaSemanalService.findByProfissionalAndDiaAndHora(request.profissionalId(),
                request.data(), request.hora().plusMinutes(request.duracao())).isPresent();

        // Se não tem disponibilidade em nenhuma das duas, lança exceção
        if (!temDisponibilidadeEspecifica && !temAgendaSemanal) {
            throw new DisponibilidadeNaoEncontradaException(
                    "Não há disponibilidade cadastrada para o profissional no horário selecionado. "
                            + "Troque o horário ou marque como encaixe.");
        }
    }

    private void processarProcedimentos(Agendamento agendamento,
            List<ProcedimentoAgendamentoRequest> procedimentosRequest) {
        if (agendamento.getProcedimentos() == null) {
            agendamento.setProcedimentos(new ArrayList<>());
        }
        for (ProcedimentoAgendamentoRequest procReq : procedimentosRequest) {
            Procedimento procedimento = procedimentoService.getById(procReq.procedimentoId());
            AgendamentoProcedimento agendamentoProcedimento = new AgendamentoProcedimento(agendamento, procedimento,
                    procReq.quantidade());

            // Calcular valor e valor de repasse usando a mesma regra do frontend
            calcularValoresProcedimento(agendamentoProcedimento, agendamento);

            agendamento.getProcedimentos().add(agendamentoProcedimento);
        }
    }

    private void calcularValoresProcedimento(AgendamentoProcedimento agendamentoProcedimento, Agendamento agendamento) {
        ProcedimentoPrecoResolver.ValorProcedimento valores = procedimentoPrecoResolver.resolve(
                agendamentoProcedimento.getProcedimento(), agendamento.getConvenio(), agendamento.getEmpresa(),
                agendamento.getUnidade());
        agendamentoProcedimento.setValor(valores.valor());
        agendamentoProcedimento.setValorRepasse(valores.repasse());
    }

    @Override
    String getNomeEntidade() {
        return "Agendamento";
    }
}
