package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.repository.PrecoProcedimentoRepository;
import java.math.BigDecimal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class PrecoProcedimentoService {

    private final PrecoProcedimentoRepository repository;

    public PrecoProcedimento getById(Long id) {
        return repository
                .findById(id)
                .orElseThrow(
                        () ->
                                new NotFoundException(
                                        "Preço Procedimento não encontrada com ID: " + id));
    }

    public PrecoProcedimento atualizaPreco(Long id, BigDecimal preco) {
        PrecoProcedimento precoProcedimento = getById(id);
        precoProcedimento.setPreco(preco);
        return repository.save(precoProcedimento);
    }
}
