package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.EmpresaPlano;
import br.com.nemeia.brigia.repository.EmpresaPlanoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmpresaPlanoService {

    private final EmpresaPlanoRepository repository;

    public Page<EmpresaPlano> getPaged(int page, int size, Boolean mostrarExcluidos) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "id"));
        return repository.findAll(pageable);
    }

    public EmpresaPlano getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Plano de Empresa não encontrado com ID: " + id));
    }
}
