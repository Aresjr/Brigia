package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.DisponibilidadeRequest;
import br.com.nemeia.brigia.mapper.DisponibilidadeMapper;
import br.com.nemeia.brigia.model.Disponibilidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.DisponibilidadeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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
        Disponibilidade disponibilidade = mapper.toEntity(request);
        Profissional profissional = profissionalService.getById(request.profissionalId());
        disponibilidade.setProfissional(profissional);
        return repository.save(disponibilidade);
    }

    public Disponibilidade editDisponibilidade(Long id, DisponibilidadeRequest request) {
        Disponibilidade disponibilidade = getById(id);
        Profissional profissional = profissionalService.getById(request.profissionalId());
        disponibilidade.setProfissional(profissional);
        disponibilidade = mapper.updateEntity(disponibilidade, request);
        return repository.save(disponibilidade);
    }

    @Override
    String getNomeEntidade() {
        return "Disponibilidade";
    }
}
