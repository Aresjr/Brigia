package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.ConvenioRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.service.ConvenioService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/convenios")
@RequiredArgsConstructor
@Slf4j
public class ConvenioController {

    private final ConvenioService service;
    private final ConvenioMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<ConvenioResponse> getAllConvenios(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos, @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /convenios - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ConvenioResponse createConvenio(@Valid @RequestBody ConvenioRequest request) {
        log.info("POST /convenios");
        return mapper.toResponse(service.createConvenio(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ConvenioResponse updateConvenio(@Valid @RequestBody ConvenioRequest request, @PathVariable Long id) {
        log.info("PUT /convenios - atualizando convênio ID {}", id);
        return mapper.toResponse(service.editConvenio(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> deleteConvenio(@PathVariable Long id) {
        log.info("DELETE /convenios - excluindo convênio ID {}", id);
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreConvenio(@PathVariable Long id) {
        log.info("PATCH /convenios/{}/restaurar", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ConvenioResponse getConvenioById(@PathVariable Long id) {
        log.info("GET /convenios/{} - buscando convenio pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }
}
