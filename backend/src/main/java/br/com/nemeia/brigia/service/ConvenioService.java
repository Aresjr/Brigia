package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.ConvenioRequest;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.repository.ConvenioRepository;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class ConvenioService extends BaseService<Convenio, ConvenioRepository> {

    private final ConvenioRepository repository;
    private final ConvenioMapper mapper;

    public ConvenioService(ConvenioRepository repository, ConvenioMapper mapper) {
        super(repository);
        this.repository = repository;
        this.mapper = mapper;
    }

    public Convenio createConvenio(ConvenioRequest request) {
        Convenio convenio = mapper.toEntity(request);
        return repository.save(convenio);
    }

    public Convenio editConvenio(Long id, ConvenioRequest request) {
        getById(id);
        Convenio convenio = mapper.toEntity(request);
        convenio.setId(id);
        return repository.save(convenio);
    }

    @Override
    String getNomeEntidade() {
        return "Convênio";
    }

}
