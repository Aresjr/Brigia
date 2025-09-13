package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.dto.response.EmpresaPlanoResponse;
import br.com.nemeia.brigia.dto.response.EmpresaResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.EmpresaMapper;
import br.com.nemeia.brigia.mapper.EmpresaPlanoMapper;
import br.com.nemeia.brigia.service.EmpresaPlanoService;
import br.com.nemeia.brigia.service.EmpresaService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/empresas")
@RequiredArgsConstructor
@Slf4j
public class EmpresaController {

    private final EmpresaService service;
    private final EmpresaPlanoService empresaPlanoService;
    private final EmpresaMapper mapper;
    private final EmpresaPlanoMapper empresaPlanoMapper;

    @GetMapping
    @PreAuthorize(
            "hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<EmpresaResponse> getAllEmpresas(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /empresas - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public EmpresaResponse createEmpresa(@Valid @RequestBody EmpresaRequest request) {
        log.info("POST /empresas");
        return mapper.toResponse(service.createEmpresa(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public EmpresaResponse updateEmpresa(
            @Valid @RequestBody EmpresaRequest request, @PathVariable Long id) {
        log.info("PUT /empresas - atualizando empresa ID {}", id);
        return mapper.toResponse(service.editEmpresa(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> deleteEmpresa(@PathVariable Long id) {
        log.info("DELETE /empresas - excluindo empresa ID {}", id);
        service.deleteEmpresa(id);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreEmpresa(@PathVariable Long id) {
        log.info("PATCH /empresas/{}/restaurar", id);
        service.restoreEmpresa(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    @PreAuthorize(
            "hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public EmpresaResponse getEmpresaById(@PathVariable Long id) {
        log.info("GET /empresas/{} - buscando empresa pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @GetMapping("/planos")
    @PreAuthorize(
            "hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<EmpresaPlanoResponse> getPlanos(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /empresas/planos - page: {}, size: {}", page, size);
        return empresaPlanoMapper.toPagedResponse(
                empresaPlanoService.getPaged(page, size, mostrarExcluidos));
    }
}
