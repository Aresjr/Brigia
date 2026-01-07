package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.DisponibilidadeRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.mapper.DisponibilidadeMapper;
import br.com.nemeia.brigia.service.DisponibilidadeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/disponibilidades")
@RequiredArgsConstructor
@Slf4j
public class DisponibilidadeController {

    private final DisponibilidadeService service;
    private final DisponibilidadeMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<DisponibilidadeResponse> getAllDisponibilidades(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos, @RequestParam(required = false) Integer mes,
            @RequestParam(required = false) Integer ano, @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return mapper.toPagedResponse(service.getByDate(mes, ano, page, size));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public DisponibilidadeResponse createDisponibilidade(@Valid @RequestBody DisponibilidadeRequest request) {
        log.info("POST /disponibilidades");
        return mapper.toResponse(service.createDisponibilidade(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public DisponibilidadeResponse updateDisponibilidade(@Valid @RequestBody DisponibilidadeRequest request,
            @PathVariable Long id) {
        log.info("PUT /disponibilidades - atualizando disponibilidade ID {}", id);
        return mapper.toResponse(service.editDisponibilidade(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> deleteDisponibilidade(@PathVariable Long id) {
        log.info("DELETE /disponibilidades - excluindo disponibilidade ID {}", id);
        service.delete(id, true);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreDisponibilidade(@PathVariable Long id) {
        log.info("PATCH /disponibilidades/{}/restaurar", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public DisponibilidadeResponse getDisponibilidadeById(@PathVariable Long id) {
        log.info("GET /disponibilidades/{} - buscando disponibilidade pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }
}
