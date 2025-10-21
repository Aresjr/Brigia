package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.AgendaSemanalRequest;
import br.com.nemeia.brigia.dto.response.AgendaSemanalResponse;
import br.com.nemeia.brigia.mapper.AgendaSemanalMapper;
import br.com.nemeia.brigia.service.AgendaSemanalService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/agendas-semanais")
@RequiredArgsConstructor
@Slf4j
public class AgendaSemanalController {

    private final AgendaSemanalService service;
    private final AgendaSemanalMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public List<AgendaSemanalResponse> getAllAgendasSemanais(@RequestParam(required = false) Long profissionalId) {
        log.info("GET /agendas-semanais - profissionalId: {}", profissionalId);
        return service.findByProfissionalId(profissionalId).stream().map(mapper::toResponse).toList();
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AgendaSemanalResponse createAgendaSemanal(@Valid @RequestBody AgendaSemanalRequest request) {
        log.info("POST /agendas-semanais");
        return mapper.toResponse(service.createAgendaSemanal(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AgendaSemanalResponse updateAgendaSemanal(@Valid @RequestBody AgendaSemanalRequest request,
            @PathVariable Long id) {
        log.info("PUT /agendas-semanais - atualizando agenda semanal ID {}", id);
        return mapper.toResponse(service.editAgendaSemanal(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> deleteAgendaSemanal(@PathVariable Long id) {
        log.info("DELETE /agendas-semanais - excluindo agenda semanal ID {}", id);
        service.delete(id, true);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreAgendaSemanal(@PathVariable Long id) {
        log.info("PATCH /agendas-semanais/{}/restaurar", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AgendaSemanalResponse getAgendaSemanalById(@PathVariable Long id) {
        log.info("GET /agendas-semanais/{} - buscando agenda semanal pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }
}
