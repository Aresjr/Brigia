package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.AgendaSemanalRequest;
import br.com.nemeia.brigia.mapper.AgendaSemanalMapper;
import br.com.nemeia.brigia.model.AgendaSemanal;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.AgendaSemanalRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    String getNomeEntidade() {
        return "Agenda Semanal";
    }
}
