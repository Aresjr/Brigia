package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.repository.UnidadeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UnidadeService extends BaseService<Unidade, UnidadeRepository> {

    private final UnidadeRepository repository;

    public UnidadeService(UnidadeRepository repository) {
        super(repository);
        this.repository = repository;
    }

    @Override
    String getNomeEntidade() {
        return "Unidade";
    }
}
