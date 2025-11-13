package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.ConvenioRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.repository.ConvenioRepository;

import jakarta.transaction.Transactional;
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

    @Transactional
    public Convenio createConvenio(ConvenioRequest request) {
        Convenio convenio = mapper.toEntity(request);
        garantirUnicidadeConvenioParticular(convenio, null);
        return repository.save(convenio);
    }

    @Transactional
    public Convenio editConvenio(Long id, ConvenioRequest request) {
        getById(id);
        Convenio convenio = mapper.toEntity(request);
        convenio.setId(id);
        garantirUnicidadeConvenioParticular(convenio, id);
        return repository.save(convenio);
    }

    public Convenio getConvenioParticular() {
        return repository.findFirstByParticularTrue()
                .orElseThrow(() -> new NotFoundException("Convênio particular não configurado."));
    }

    private void garantirUnicidadeConvenioParticular(Convenio convenio, Long idAtual) {
        if (Boolean.TRUE.equals(convenio.getParticular())) {
            repository.clearParticularExcept(idAtual);
        }
    }

    @Override
    String getNomeEntidade() {
        return "Convênio";
    }

}
