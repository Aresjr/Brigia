package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.HonorarioRequest;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import br.com.nemeia.brigia.repository.HonorarioRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
public class HonorarioService extends BaseService<Honorario, HonorarioRepository> {

    private final ProfissionalService profissionalService;
    private final UnidadeService unidadeService;
    private final AgendamentoRepository agendamentoRepository;

    public HonorarioService(HonorarioRepository repository,
                           ProfissionalService profissionalService,
                           UnidadeService unidadeService,
                           AgendamentoRepository agendamentoRepository) {
        super(repository);
        this.profissionalService = profissionalService;
        this.unidadeService = unidadeService;
        this.agendamentoRepository = agendamentoRepository;
    }

    @Transactional
    public Honorario gerarHonorario(HonorarioRequest request) {
        Profissional profissional = profissionalService.getById(request.profissionalId());
        LocalDate data = request.data();
        Unidade unidade = unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId());

        // Buscar agendamentos finalizados do profissional na data
        List<Agendamento> agendamentos = agendamentoRepository.findAllByDate(
                null,
                SecurityHolder.getLoggedUserUnidadeId(),
                data,
                data
        ).stream()
        .filter(ag -> ag.getProfissional().getId().equals(request.profissionalId())
                && ag.getStatus() == StatusAgendamento.FINALIZADO)
        .toList();

        // Calcular valor total baseado nos valores de repasse
        BigDecimal valorTotal = calcularValorTotal(agendamentos);

        Honorario honorario = new Honorario(
                profissional,
                data,
                valorTotal,
                agendamentos.size(),
                unidade
        );

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

    @Override
    String getNomeEntidade() {
        return "Honorário";
    }
}
