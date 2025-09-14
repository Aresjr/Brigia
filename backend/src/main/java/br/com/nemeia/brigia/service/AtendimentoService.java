package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.atendimento.AtendimentoRequest;
import br.com.nemeia.brigia.mapper.AtendimentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import jakarta.validation.Valid;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
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
    private final AtendimentoMapper mapper;

    public AtendimentoService(AtendimentoRepository repository, SecurityUtils securityUtils, AtendimentoMapper mapper,
            ProfissionalService profissionalService, AgendamentoService agendamentoService,
            ProcedimentoService procedimentoService, PrecoProcedimentoService precoProcedimentoService) {
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
        atendimento.setProfissional(profissionalService.getByUsuarioId(securityUtils.getLoggedUserId()));

        setEntidades(atendimento, agendamento);

        List<ProcedimentoAtendimento> pa = new ArrayList<>();
        List<BigDecimal> valoresLancados = new ArrayList<>();
        request.procedimentos().forEach(par -> {
            Procedimento procedimento = procedimentoService.getById(par.procedimentoId());
            valoresLancados.add(precoProcedimentoService.getPreco(procedimento, agendamento.getConvenio())
                    .multiply(BigDecimal.valueOf(par.quantidade())));
            pa.add(new ProcedimentoAtendimento(atendimento, procedimento, par.quantidade()));
        });
        atendimento.setProcedimentos(pa);
        atendimento.setValorTotal(valoresLancados.stream().reduce(BigDecimal.ZERO, BigDecimal::add));

        atendimento.setData(LocalDate.now());
        atendimento.setHoraFim(LocalTime.now());

        Atendimento  atendimentoNovo = repository.save(atendimento);

        agendamento.setStatus(StatusAgendamento.FINALIZADO);
        agendamentoService.update(agendamento);

        return atendimentoNovo;
    }

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
        atendimento.setAgendamento(agendamento);
        atendimento.setConvenio(agendamento.getConvenio());
        atendimento.setEmpresa(agendamento.getEmpresa());
        atendimento.setEspecialidade(agendamento.getEspecialidade());
        atendimento.setFormaPagamento(agendamento.getFormaPagamento());
        atendimento.setPaciente(agendamento.getPaciente());
    }

    @Override
    String getNomeEntidade() {
        return "Atendimento";
    }
}
