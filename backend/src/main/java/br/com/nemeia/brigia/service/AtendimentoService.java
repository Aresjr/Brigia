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

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class AtendimentoService extends BaseService<Atendimento, AtendimentoRepository> {

    private final ProfissionalService profissionalService;
    private final AgendamentoService agendamentoService;
    private final ProcedimentoService procedimentoService;
    private final PrecoProcedimentoService precoProcedimentoService;
    private final AtendimentoMapper mapper;

    public AtendimentoService(
            AtendimentoRepository repository,
            SecurityUtils securityUtils,
            AtendimentoMapper mapper,
            ProfissionalService profissionalService,
            AgendamentoService agendamentoService,
            ProcedimentoService procedimentoService,
            PrecoProcedimentoService precoProcedimentoService) {
        super(repository, securityUtils);
        this.mapper = mapper;
        this.profissionalService = profissionalService;
        this.agendamentoService = agendamentoService;
        this.procedimentoService = procedimentoService;
        this.precoProcedimentoService = precoProcedimentoService;
    }

    public Page<Atendimento> getPaged(int page, int size, boolean mostrarExcluidos) {
        return repository.findByExcluido(mostrarExcluidos, PageRequest.of(page, size));
    }

    @Transactional
    public Atendimento createAtendimento(AtendimentoRequest request) {
        Atendimento atendimento = mapper.toEntity(request);

        Agendamento agendamento = agendamentoService.getById(request.agendamentoId());

        atendimento.setUnidade(new Unidade(securityUtils.getLoggedUserUnidadeId()));
        atendimento.setProfissional(
                profissionalService.getByUsuarioId(securityUtils.getLoggedUserId()));

        setEntidades(request, atendimento, agendamento);

        List<ProcedimentoAtendimento> pa = new ArrayList<>();
        List<BigDecimal> valoresLancados = new ArrayList<>();
        request.procedimentos().forEach( par -> {
            Procedimento procedimento = procedimentoService.getById(par.procedimentoId());
            valoresLancados.add(precoProcedimentoService.getPreco(procedimento, agendamento.getConvenio()));
            pa.add(new ProcedimentoAtendimento(atendimento, procedimento, par.quantidade()));
        });
        atendimento.setProcedimentos(pa);
        atendimento.setValorTotal(valoresLancados.stream().reduce(BigDecimal.ZERO, BigDecimal::add));

        return repository.save(atendimento);
    }

    public Atendimento update(@Valid AtendimentoRequest request, Long id) {
        Atendimento original = getById(id);
        Atendimento atendimentoUpdate = mapper.toEntity(request);

        Agendamento agendamento = agendamentoService.getById(request.agendamentoId());
        setEntidades(request, atendimentoUpdate, agendamento);

        atendimentoUpdate.setId(original.getId());
        atendimentoUpdate.setUnidade(original.getUnidade());
        atendimentoUpdate.setPaciente(original.getPaciente());
        atendimentoUpdate.setProfissional(original.getProfissional());
        atendimentoUpdate.setAgendamento(original.getAgendamento());
        return repository.save(atendimentoUpdate);
    }

    private void setEntidades(AtendimentoRequest request, Atendimento atendimento, Agendamento agendamento) {
        atendimento.setAgendamento(agendamento);
        atendimento.setConvenio(agendamento.getConvenio());
        atendimento.setEmpresa(agendamento.getEmpresa());
        atendimento.setEspecialidade(agendamento.getEspecialidade());
        atendimento.setFormaPagamento(agendamento.getFormaPagamento());
    }

    @Override
    String getNomeEntidade() {
        return "Atendimento";
    }
}
