package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.EspecialidadeRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.EspecialidadeMapper;
import br.com.nemeia.brigia.model.Especialidade;
import br.com.nemeia.brigia.repository.EspecialidadeRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EspecialidadeService {

    private final EspecialidadeRepository repository;
    private final EspecialidadeMapper mapper;

    public Page<Especialidade> getPaged(int page, int size, Boolean mostrarExcluidos) {
        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);
        return mostrarExcluidos
                ? repository.findAll(pageable)
                : repository.findAllByExcluidoIsOrExcluidoIsNull(pageable, false);
    }

    public Especialidade getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Especialidade não encontrada com ID: " + id));
    }

    public Especialidade createEspecialidade(EspecialidadeRequest request) {
        Especialidade especialidade = mapper.toEntity(request);
        return repository.save(especialidade);
    }

    public Especialidade editEspecialidade(Long id, EspecialidadeRequest request) {
        getById(id);
        Especialidade especialidade = mapper.toEntity(request);
        especialidade.setId(id);
        return repository.save(especialidade);
    }

    public void deleteEspecialidade(Long id) {
        Especialidade especialidade = getById(id);
        especialidade.setExcluido(true);
        especialidade.setExcluidoEm(LocalDateTime.now());

        Long userId = SecurityHolder.getLoggedUserId();
        especialidade.setExcluidoPor(userId);
        repository.save(especialidade);
    }

    public void restoreEspecialidade(Long id) {
        Especialidade especialidade = getById(id);
        especialidade.setExcluido(false);
        especialidade.setExcluidoEm(null);
        especialidade.setExcluidoPor(null);
        repository.save(especialidade);
    }
}
