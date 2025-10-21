package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.HonorarioRequest;
import br.com.nemeia.brigia.exception.HonorarioJaExistenteException;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.AgendamentoRepository;
import br.com.nemeia.brigia.repository.AgendaSemanalRepository;
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
    private final AgendaSemanalRepository agendaSemanalRepository;

    public HonorarioService(HonorarioRepository repository, ProfissionalService profissionalService,
            UnidadeService unidadeService, AgendamentoRepository agendamentoRepository,
            DisponibilidadeRepository disponibilidadeRepository,
            AgendaSemanalRepository agendaSemanalRepository) {
        super(repository);
        this.profissionalService = profissionalService;
        this.unidadeService = unidadeService;
        this.agendamentoRepository = agendamentoRepository;
        this.disponibilidadeRepository = disponibilidadeRepository;
        this.agendaSemanalRepository = agendaSemanalRepository;
    }

    @Transactional
    public Honorario gerarHonorario(HonorarioRequest request) {
        Profissional profissional = profissionalService.getById(request.profissionalId());
        LocalDate data = request.data();
        Unidade unidade = unidadeService.getById(SecurityHolder.getLoggedUserUnidadeId());

        // Validar se já existe honorário para o profissional na data
        Optional<Honorario> honorarioExistente = repository.findByProfissionalAndData(
                request.profissionalId(), data);
        if (honorarioExistente.isPresent()) {
            throw new HonorarioJaExistenteException();
        }

        // Buscar agendamentos finalizados do profissional na data
        List<Agendamento> agendamentos = agendamentoRepository
                .findAllByDate(null, SecurityHolder.getLoggedUserUnidadeId(), data, data).stream()
                .filter(ag -> ag.getProfissional().getId().equals(request.profissionalId())).toList();

        // Calcular valor total baseado nos valores de repasse
        BigDecimal valorRepasse = calcularValorTotal(agendamentos);

        // Buscar valor adicional da disponibilidade
        BigDecimal valorAdicional = calcularValorAdicional(request.profissionalId(), request.data());

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

    private BigDecimal calcularValorAdicional(Long profissionalId, LocalDate data) {

        // Buscar TODAS as disponibilidades do dia para o profissional
        List<Disponibilidade> disponibilidades = disponibilidadeRepository
                .findConflitosHorario(profissionalId, data,
                    java.time.LocalTime.MIN, java.time.LocalTime.MAX);

        // Somar todos os valores adicionais das disponibilidades do dia
        BigDecimal valorDiario = disponibilidades.stream()
                .map(Disponibilidade::getValorAdicional)
                .filter(valor -> valor != null)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        if (valorDiario.compareTo(BigDecimal.ZERO) > 0) {
            return valorDiario;
        }

        // Se não encontrou na disponibilidade diária, buscar na agenda semanal
        Integer diaSemana = data.getDayOfWeek().getValue() % 7; // Converter para 0=Domingo, 6=Sábado
        List<AgendaSemanal> agendasSemanais = agendaSemanalRepository
                .findByProfissionalIdAndDiaSemana(profissionalId, diaSemana);

        // Somar todos os valores adicionais das agendas semanais
        BigDecimal valorSemanal = agendasSemanais.stream()
                .map(AgendaSemanal::getValorAdicional)
                .filter(valor -> valor != null)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return valorSemanal;
    }

    @Override
    String getNomeEntidade() {
        return "Honorário";
    }
}
