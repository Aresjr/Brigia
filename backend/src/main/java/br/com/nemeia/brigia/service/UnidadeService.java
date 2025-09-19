package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.repository.UnidadeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UnidadeService {

    private final UnidadeRepository repository;

    public Unidade getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Unidade não encontrada com ID: " + id));
    }
}
