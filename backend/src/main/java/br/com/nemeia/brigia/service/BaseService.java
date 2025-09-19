package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.BaseModel;
import br.com.nemeia.brigia.repository.BaseRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

@RequiredArgsConstructor
public abstract class BaseService<T extends BaseModel, R extends BaseRepository<T>> {

    @Autowired
    protected final R repository;

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

        Long userId = SecurityHolder.getLoggedUserId();
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
