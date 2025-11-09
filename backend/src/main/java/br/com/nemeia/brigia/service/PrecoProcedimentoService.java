package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.PrecoProcedimentoRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.PrecoProcedimentoMapper;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.Procedimento;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.repository.PrecoProcedimentoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class PrecoProcedimentoService {

    private final PrecoProcedimentoRepository repository;
    private final PrecoProcedimentoMapper mapper;

    public PrecoProcedimento getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Preço Procedimento não encontrada com ID: " + id));
    }

    public PrecoProcedimento save(Procedimento procedimento, Convenio convenio, Unidade unidade,
            PrecoProcedimentoRequest request) {
        PrecoProcedimento precoProcedimento = mapper.toPrecoProcedimento(procedimento, convenio, unidade, request);
        return repository.save(precoProcedimento);
    }
}
