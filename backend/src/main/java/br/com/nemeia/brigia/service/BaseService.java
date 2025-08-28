package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.BaseModel;
import br.com.nemeia.brigia.repository.BaseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;

@RequiredArgsConstructor
public abstract class BaseService<T extends BaseModel, R extends BaseRepository<T>> {

    protected R repository;
    protected SecurityUtils securityUtils;

    public T getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException(getNomeEntidade() + " não encontrado com ID:" + id));
    }

    public Page<T> getPaged(int page, int size, Boolean mostrarExcluidos) {
        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);
        return mostrarExcluidos
                ? repository.findAll(pageable)
                : repository.findAllByExcluidoIsOrExcluidoIsNull(pageable, false);
    }

    public void delete(Long id) {
        T entity = getById(id);
        entity.setExcluido(true);
        entity.setExcluidoEm(LocalDateTime.now());

        Long userId = securityUtils.getLoggedUserId();
        entity.setExcluidoPor(userId);
        repository.save(entity);
    }

    public void restore(Long id) {
        T entity = getById(id);
        entity.setExcluido(false);
        entity.setExcluidoEm(null);
        entity.setExcluidoPor(null);
        repository.save(entity);
    }

    abstract String getNomeEntidade();
}
