package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AtendimentoRequest;
import br.com.nemeia.brigia.mapper.AtendimentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import br.com.nemeia.brigia.utils.DbUtil;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AtendimentoService extends BaseService<Atendimento, AtendimentoRepository> {

    private final ProfissionalService profissionalService;
    private final AgendamentoService agendamentoService;
    private final PacienteService pacienteService;
    private final AtendimentoMapper mapper;

    public AtendimentoService(AtendimentoRepository repository, AtendimentoMapper mapper,
            ProfissionalService profissionalService, AgendamentoService agendamentoService,
            PacienteService pacienteService) {
        super(repository);
        this.mapper = mapper;
        this.profissionalService = profissionalService;
        this.agendamentoService = agendamentoService;
        this.pacienteService = pacienteService;
    }

    public Page<Atendimento> getPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);
        return repository.findAllByUnidadeIdIs(pageable, SecurityHolder.getLoggedUserUnidadeId());
    }

    @Transactional
    public Atendimento createAtendimento(AtendimentoRequest request) {
        Atendimento atendimento = mapper.toEntity(request);

        Agendamento agendamento = agendamentoService.getById(request.agendamentoId());

        setEntidades(atendimento, agendamento);

        atendimento.setData(LocalDate.now());
        atendimento.setHoraFim(LocalTime.now());

        Atendimento atendimentoNovo = repository.save(atendimento);
        agendamentoService.updateStatus(agendamento, StatusAgendamento.FINALIZADO);
        return atendimentoNovo;
    }

    private void setEntidades(Atendimento atendimento, Agendamento agendamento) {
        atendimento.setProfissional(profissionalService.getByUsuarioId(SecurityHolder.getLoggedUserId()));

        atendimento.setAgendamento(agendamento);
        atendimento.setConvenio(agendamento.getConvenio());
        atendimento.setEmpresa(agendamento.getEmpresa());
        atendimento.setEspecialidade(agendamento.getEspecialidade());
        atendimento.setFormaPagamento(agendamento.getFormaPagamento());
        atendimento.setPaciente(agendamento.getPaciente());
    }

    public Atendimento iniciarAtendimento(Long agendamentoId) {
        Agendamento agendamento = agendamentoService.getById(agendamentoId);

        Atendimento atendimento = new Atendimento();
        setEntidades(atendimento, agendamento);
        atendimento.setStatus(StatusAtendimento.EM_ATENDIMENTO);
        atendimento.setData(LocalDate.now());
        atendimento.setHoraInicio(LocalTime.now());
        atendimento = repository.save(atendimento);

        agendamentoService.updateStatus(agendamento, StatusAgendamento.EM_ATENDIMENTO);
        return atendimento;
    }

    @Transactional
    public Atendimento finalizarAtendimento(Long id, AtendimentoRequest request) {
        Atendimento atendimento = getById(id);

        Agendamento agendamento = agendamentoService.getById(atendimento.getAgendamento().getId());
        setValoresDescritivos(atendimento, request);

        atendimento.setData(LocalDate.now());
        atendimento.setHoraFim(LocalTime.now());
        atendimento.setStatus(StatusAtendimento.FINALIZADO);
        atendimento = repository.save(atendimento);

        finalizaAgendamento(agendamento);
        atualizaDataUltimaConsultaPaciente(agendamento);

        return atendimento;
    }

    private void finalizaAgendamento(Agendamento agendamento) {
        agendamentoService.updateStatus(agendamento, StatusAgendamento.FINALIZADO);
    }

    private void atualizaDataUltimaConsultaPaciente(Agendamento agendamento) {
        agendamento.getPaciente().setUltimaConsulta(LocalDateTime.now());
        pacienteService.update(agendamento.getPaciente());
    }

    private void setValoresDescritivos(Atendimento atendimento, AtendimentoRequest request) {
        atendimento.setAnamnese(request.anamnese());
        atendimento.setExameFisico(request.exameFisico());
        atendimento.setDiagnostico(request.diagnostico());
        atendimento.setEvolucaoClinica(request.evolucaoClinica());
        atendimento.setExamesSolicitados(request.examesSolicitados());
        atendimento.setPrescricoes(request.prescricoes());
        atendimento.setObservacoes(request.observacoes());
    }

    @Override
    String getNomeEntidade() {
        return "Atendimento";
    }

}
