package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.AgendaSemanalRequest;
import br.com.nemeia.brigia.mapper.AgendaSemanalMapper;
import br.com.nemeia.brigia.model.AgendaSemanal;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.AgendaSemanalRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class AgendaSemanalService extends BaseService<AgendaSemanal, AgendaSemanalRepository> {

    private final AgendaSemanalRepository repository;
    private final AgendaSemanalMapper mapper;
    private final ProfissionalService profissionalService;

    public AgendaSemanalService(AgendaSemanalRepository repository, AgendaSemanalMapper mapper,
            ProfissionalService profissionalService) {
        super(repository);
        this.repository = repository;
        this.mapper = mapper;
        this.profissionalService = profissionalService;
    }

    public AgendaSemanal createAgendaSemanal(AgendaSemanalRequest request) {
        AgendaSemanal agendaSemanal = mapper.toEntity(request);
        Profissional profissional = profissionalService.getById(request.profissionalId());
        agendaSemanal.setProfissional(profissional);

        return repository.save(agendaSemanal);
    }

    public AgendaSemanal editAgendaSemanal(Long id, AgendaSemanalRequest request) {
        AgendaSemanal agendaSemanal = getById(id);
        Profissional profissional = profissionalService.getById(request.profissionalId());
        agendaSemanal.setProfissional(profissional);

        agendaSemanal = mapper.updateEntity(agendaSemanal, request);
        return repository.save(agendaSemanal);
    }

    public List<AgendaSemanal> findByProfissionalId(Long profissionalId) {
        return repository.findAllByProfissionalId(profissionalId);
    }

    public List<AgendaSemanal> findByProfissionalIdAndDiaSemana(Long profissionalId, Integer diaSemana) {
        return repository.findByProfissionalIdAndDiaSemana(profissionalId, diaSemana);
    }

    public Optional<AgendaSemanal> findByProfissionalAndDiaAndHora(Long profissionalId, LocalDate dia,
            LocalTime hora) {
        // Converte LocalDate para dia da semana (DayOfWeek.getValue() retorna 1-7, sendo 1 = Segunda)
        // Mas precisamos ajustar para 0 = Domingo, 1 = Segunda, ... 6 = Sábado
        int diaSemanaJava = dia.getDayOfWeek().getValue(); // 1 = Segunda, 7 = Domingo
        int diaSemana = (diaSemanaJava == 7) ? 0 : diaSemanaJava; // Converte para 0 = Domingo

        return repository.findByProfissionalAndDiaSemanaAndHora(profissionalId, diaSemana, hora);
    }

    @Override
    String getNomeEntidade() {
        return "Agenda Semanal";
    }
}
