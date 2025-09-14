package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.Utils;
import br.com.nemeia.brigia.auth.SecurityUtils;
import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.EmpresaMapper;
import br.com.nemeia.brigia.model.Empresa;
import br.com.nemeia.brigia.model.EmpresaPlano;
import br.com.nemeia.brigia.repository.EmpresaRepository;
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
public class EmpresaService {

    private final EmpresaRepository repository;
    private final EmpresaMapper mapper;
    private final SecurityUtils securityUtils;
    private final EmpresaPlanoService empresaPlanoService;

    public Page<Empresa> getPaged(int page, int size, Boolean mostrarExcluidos) {
        Pageable pageable = PageRequest.of(page, size, Utils.DEFAULT_SORT);
        return mostrarExcluidos
                ? repository.findAll(pageable)
                : repository.findAllByExcluidoIsOrExcluidoIsNull(pageable, false);
    }

    public Empresa getById(Long id) {
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Empresa não encontrado com ID: " + id));
    }

    public Empresa createEmpresa(EmpresaRequest request) {
        Empresa empresa = mapper.toEntity(request);
        return repository.save(empresa);
    }

    public Empresa editEmpresa(Long id, EmpresaRequest request) {
        getById(id);
        Empresa empresa = mapper.toEntity(request);

        if (request.planoId() != null) {
            EmpresaPlano empresaPlano = empresaPlanoService.getById(request.planoId());
            empresa.setPlano(empresaPlano);
        }

        empresa.setId(id);
        return repository.save(empresa);
    }

    public void deleteEmpresa(Long id) {
        Empresa empresa = getById(id);
        empresa.setExcluido(true);
        empresa.setExcluidoEm(LocalDateTime.now());

        Long userId = securityUtils.getLoggedUserId();
        empresa.setExcluidoPor(userId);
        repository.save(empresa);
    }

    public void restoreEmpresa(Long id) {
        Empresa empresa = getById(id);
        empresa.setExcluido(false);
        empresa.setExcluidoEm(null);
        empresa.setExcluidoPor(null);
        repository.save(empresa);
    }
}
