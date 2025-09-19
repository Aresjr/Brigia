package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.ContaReceber;
import br.com.nemeia.brigia.repository.ContaReceberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ContaReceberService {

    private final ContaReceberRepository repository;

    @Transactional(readOnly = true)
    public Page<ContaReceber> getPaged(int page, int size) {
        log.info("Buscando contas a receber paginadas - page: {}, size: {}", page, size);
        var pageable = PageRequest.of(page, size);
        return repository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public ContaReceber getById(Long id) {
        log.info("Buscando conta a receber por ID: {}", id);
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Conta a receber não encontrada"));
    }
}
