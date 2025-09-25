package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AtendimentoRequest;
import br.com.nemeia.brigia.dto.request.ProcedimentoAtendimentoRequest;
import br.com.nemeia.brigia.mapper.AtendimentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import jakarta.validation.Valid;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AtendimentoService extends BaseService<Atendimento, AtendimentoRepository> {

    private final ProfissionalService profissionalService;
    private final AgendamentoService agendamentoService;
    private final ProcedimentoService procedimentoService;
    private final PrecoProcedimentoService precoProcedimentoService;
    private final ContaReceberService contaReceberService;
    private final AtendimentoMapper mapper;

    public AtendimentoService(AtendimentoRepository repository, AtendimentoMapper mapper,
            ProfissionalService profissionalService, AgendamentoService agendamentoService,
            ProcedimentoService procedimentoService, PrecoProcedimentoService precoProcedimentoService,
            ContaReceberService contaReceberService) {
        super(repository);
        this.mapper = mapper;
        this.profissionalService = profissionalService;
        this.agendamentoService = agendamentoService;
        this.procedimentoService = procedimentoService;
        this.precoProcedimentoService = precoProcedimentoService;
        this.contaReceberService = contaReceberService;
    }

    public Page<Atendimento> getPaged(int page, int size) {
        return repository.findAllByUnidadeIdIs(PageRequest.of(page, size), SecurityHolder.getLoggedUserUnidadeId());
    }

    @Transactional
    public Atendimento createAtendimento(AtendimentoRequest request) {
        Atendimento atendimento = mapper.toEntity(request);

        Agendamento agendamento = agendamentoService.getById(request.agendamentoId());

        setEntidades(atendimento, agendamento);
        setProcedimentos(atendimento, request.procedimentos(), agendamento.getConvenio());

        atendimento.setData(LocalDate.now());
        atendimento.setHoraFim(LocalTime.now());

        Atendimento atendimentoNovo = repository.save(atendimento);
        agendamentoService.updateStatus(agendamento, StatusAgendamento.FINALIZADO);

        return atendimentoNovo;
    }

    private void setProcedimentos(Atendimento atendimento, List<ProcedimentoAtendimentoRequest> procedimentos,
            Convenio convenio) {
        List<ProcedimentoAtendimento> pa = new ArrayList<>();
        List<BigDecimal> valoresLancados = new ArrayList<>();
        procedimentos.forEach(par -> {
            Procedimento procedimento = procedimentoService.getById(par.procedimentoId());
            valoresLancados.add(precoProcedimentoService.getPreco(procedimento, convenio)
                    .multiply(BigDecimal.valueOf(par.quantidade())));
            pa.add(new ProcedimentoAtendimento(atendimento, procedimento, par.quantidade()));
        });
        atendimento.getProcedimentos().addAll(pa);
        atendimento.setValorAgendamento(atendimento.getAgendamento().getValor());
        atendimento.setValorLancado(valoresLancados.stream().reduce(BigDecimal.ZERO, BigDecimal::add));
    }

    @Transactional
    public Atendimento update(@Valid AtendimentoRequest request, Long id) {
        Atendimento original = getById(id);
        Atendimento atendimentoUpdate = mapper.toEntity(request);

        Agendamento agendamento = agendamentoService.getById(request.agendamentoId());
        setEntidades(atendimentoUpdate, agendamento);

        atendimentoUpdate.setId(original.getId());
        atendimentoUpdate.setUnidade(original.getUnidade());
        atendimentoUpdate.setPaciente(original.getPaciente());
        atendimentoUpdate.setProfissional(original.getProfissional());
        atendimentoUpdate.setAgendamento(original.getAgendamento());
        return repository.save(atendimentoUpdate);
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

        setProcedimentos(atendimento, request.procedimentos(), agendamento.getConvenio());

        atendimento.setData(LocalDate.now());
        atendimento.setHoraFim(LocalTime.now());
        atendimento.setStatus(StatusAtendimento.FINALIZADO);

        atendimento = repository.save(atendimento);

        agendamentoService.updateStatus(agendamento, StatusAgendamento.FINALIZADO);

        contaReceberService.createContaReceber(atendimento);
        // TODO - testar

        return atendimento;
    }

    @Override
    String getNomeEntidade() {
        return "Atendimento";
    }

}
