package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.HonorarioRequest;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import br.com.nemeia.brigia.repository.DisponibilidadeRepository;
import br.com.nemeia.brigia.repository.HonorarioRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class HonorarioService extends BaseService<Honorario, HonorarioRepository> {

    private final ProfissionalService profissionalService;
    private final UnidadeService unidadeService;
    private final AgendamentoRepository agendamentoRepository;
    private final DisponibilidadeRepository disponibilidadeRepository;

    public HonorarioService(HonorarioRepository repository, ProfissionalService profissionalService,
            UnidadeService unidadeService, AgendamentoRepository agendamentoRepository,
            DisponibilidadeRepository disponibilidadeRepository) {
        super(repository);
        this.profissionalService = profissionalService;
        this.unidadeService = unidadeService;
        this.agendamentoRepository = agendamentoRepository;
        this.disponibilidadeRepository = disponibilidadeRepository;
    }

    @Transactional
    public Honorario gerarHonorario(HonorarioRequest request) {
        Profissional profissional = profissionalService.getById(request.profissionalId());
        LocalDate data = request.data();
        Unidade unidade = unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId());

        // Buscar agendamentos finalizados do profissional na data
        List<Agendamento> agendamentos = agendamentoRepository
                .findAllByDate(null, SecurityHolder.getLoggedUserUnidadeId(), data, data).stream()
                .filter(ag -> ag.getProfissional().getId().equals(request.profissionalId())).toList();

        // Calcular valor total baseado nos valores de repasse
        BigDecimal valorRepasse = calcularValorTotal(agendamentos);

        // Buscar valor adicional da disponibilidade
        BigDecimal valorAdicional = calcularValorAdicional(agendamentos);

        // Somar valor de repasse + valor adicional
        BigDecimal valorTotal = valorRepasse.add(valorAdicional != null ? valorAdicional : BigDecimal.ZERO);

        Honorario honorario = new Honorario(profissional, data, valorTotal, agendamentos.size(), unidade,
                valorAdicional);

        return repository.save(honorario);
    }

    private BigDecimal calcularValorTotal(List<Agendamento> agendamentos) {
        BigDecimal total = BigDecimal.ZERO;

        for (Agendamento ag : agendamentos) {
            // Adicionar valor de repasse do procedimento principal
            if (ag.getProcedimento() != null && ag.getProcedimento().getValorRepasse() != null) {
                total = total.add(ag.getProcedimento().getValorRepasse());
            }

            // Adicionar valores de repasse dos procedimentos secundários
            if (ag.getProcedimentos() != null) {
                for (AgendamentoProcedimento proc : ag.getProcedimentos()) {
                    if (proc.getValorRepasse() != null) {
                        BigDecimal valorProcedimento = proc.getValorRepasse()
                                .multiply(BigDecimal.valueOf(proc.getQuantidade()));
                        total = total.add(valorProcedimento);
                    }
                }
            }
        }

        return total;
    }

    private BigDecimal calcularValorAdicional(List<Agendamento> agendamentos) {
        BigDecimal totalAdicional = BigDecimal.ZERO;

        for (Agendamento ag : agendamentos) {
            // Buscar disponibilidade associada ao agendamento
            Optional<Disponibilidade> disponibilidadeOpt = disponibilidadeRepository
                    .findByProfissionalAndDiaAndHora(ag.getProfissional().getId(), ag.getData(), ag.getHora());

            if (disponibilidadeOpt.isPresent() && disponibilidadeOpt.get().getValorAdicional() != null) {
                totalAdicional = totalAdicional.add(disponibilidadeOpt.get().getValorAdicional());
            }
        }

        return totalAdicional;
    }

    @Override
    String getNomeEntidade() {
        return "Honorário";
    }
}
