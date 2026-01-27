package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.DisponibilidadeRequest;
import br.com.nemeia.brigia.exception.ConflitoBlocoHorarioException;
import br.com.nemeia.brigia.mapper.DisponibilidadeMapper;
import br.com.nemeia.brigia.model.Disponibilidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.DisponibilidadeRepository;
import br.com.nemeia.brigia.utils.DbUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class DisponibilidadeService extends BaseService<Disponibilidade, DisponibilidadeRepository> {

    private final DisponibilidadeRepository repository;
    private final DisponibilidadeMapper mapper;
    private final ProfissionalService profissionalService;

    public DisponibilidadeService(DisponibilidadeRepository repository, DisponibilidadeMapper mapper,
            ProfissionalService profissionalService) {
        super(repository);
        this.repository = repository;
        this.mapper = mapper;
        this.profissionalService = profissionalService;
    }

    public Disponibilidade createDisponibilidade(DisponibilidadeRequest request) {
        Profissional profissional = profissionalService.getById(request.profissionalId());

        // Se não há intervalo, criar um único registro
        if (request.intervalo() == null || request.intervalo() <= 0) {
            Disponibilidade disponibilidade = mapper.toEntity(request);
            disponibilidade.setProfissional(profissional);

            // Verifica se há conflito de horário
            verificarConflitoHorario(request.profissionalId(), request.dia(), request.horaInicial(), request.horaFinal(),
                    null);

            return repository.save(disponibilidade);
        } else {
            // Se há intervalo, criar múltiplos registros
            List<Disponibilidade> disponibilidades = gerarDisponibilidadesPorIntervalo(request, profissional);
            
            // Salvar todos os registros
            repository.saveAll(disponibilidades);
            
            // Retornar o primeiro registro criado
            return disponibilidades.get(0);
        }
    }

    public Disponibilidade editDisponibilidade(Long id, DisponibilidadeRequest request) {
        Disponibilidade disponibilidade = getById(id);
        Profissional profissional = profissionalService.getById(request.profissionalId());
        disponibilidade.setProfissional(profissional);

        // Verifica se há conflito de horário (exclui a própria disponibilidade da
        // verificação)
        verificarConflitoHorario(request.profissionalId(), request.dia(), request.horaInicial(), request.horaFinal(),
                id);

        disponibilidade = mapper.updateEntity(disponibilidade, request);
        return repository.save(disponibilidade);
    }

    public Page<Disponibilidade> getByDate(Integer mes, Integer ano, int page, int size) {
        if (mes == null) {
            mes = LocalDate.now().getMonthValue();
        }
        if (ano == null) {
            ano = LocalDate.now().getYear();
        }
        LocalDate startDate = LocalDate.of(ano, mes, 1).minusMonths(1);
        LocalDate endDate = LocalDate.of(ano, mes, 1).plusMonths(2).minusDays(1);

        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);

        return repository.findAllByDateRange(pageable, startDate, endDate, SecurityHolder.getLoggedUserUnidadeId());
    }

    public Optional<Disponibilidade> findByProfissionalAndDiaAndHora(Long profissionalId, LocalDate dia,
            LocalTime hora) {
        return repository.findByProfissionalAndDiaAndHora(profissionalId, dia, hora,
                SecurityHolder.getLoggedUserUnidadeId());
    }

    @Override
    String getNomeEntidade() {
        return "Disponibilidade";
    }

    private void verificarConflitoHorario(Long profissionalId, LocalDate dia, LocalTime horaInicial,
            LocalTime horaFinal, Long idDisponibilidadeAtual) {
        List<Disponibilidade> conflitos = repository.findConflitosHorario(profissionalId, dia, horaInicial, horaFinal,
                SecurityHolder.getLoggedUserUnidadeId());

        // Se está editando, remove a própria disponibilidade da lista de conflitos
        if (idDisponibilidadeAtual != null) {
            conflitos = conflitos.stream().filter(d -> !d.getId().equals(idDisponibilidadeAtual)).toList();
        }

        if (!conflitos.isEmpty()) {
            throw new ConflitoBlocoHorarioException();
        }
    }

    private List<Disponibilidade> gerarDisponibilidadesPorIntervalo(DisponibilidadeRequest request, Profissional profissional) {
        List<Disponibilidade> disponibilidades = new ArrayList<>();
        LocalTime horaAtual = request.horaInicial();
        Integer intervalo = request.intervalo();

        while (horaAtual.isBefore(request.horaFinal())) {
            // Calcular a hora final do intervalo
            LocalTime horaFim = horaAtual.plusMinutes(intervalo);
            
            // Se a hora final do intervalo ultrapassar a hora final da disponibilidade,
            // usar a hora final
            if (horaFim.isAfter(request.horaFinal())) {
                horaFim = request.horaFinal();
            }

            // Verificar conflito para este intervalo
            verificarConflitoHorario(request.profissionalId(), request.dia(), horaAtual, horaFim, null);

            // Criar disponibilidade para este intervalo
            Disponibilidade disponibilidade = new Disponibilidade();
            disponibilidade.setProfissional(profissional);
            disponibilidade.setDia(request.dia());
            disponibilidade.setHoraInicial(horaAtual);
            disponibilidade.setHoraFinal(horaFim);
            disponibilidade.setValorAdicional(request.valorAdicional());
            disponibilidade.setIntervalo(intervalo);

            disponibilidades.add(disponibilidade);

            // Avançar para o próximo intervalo
            horaAtual = horaFim;
        }

        return disponibilidades;
    }
}
