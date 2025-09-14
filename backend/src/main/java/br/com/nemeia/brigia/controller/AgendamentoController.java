package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.AgendamentoPatchRequest;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.dto.response.AgendamentoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.AgendamentoMapper;
import br.com.nemeia.brigia.service.AgendamentoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/agendamentos")
@RequiredArgsConstructor
@Slf4j
public class AgendamentoController {

    private final AgendamentoService service;
    private final AgendamentoMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<AgendamentoResponse> getAllAgendamentos(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos, @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /agendamentos - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getByProfissional(page, size));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public AgendamentoResponse createAgendamento(@Valid @RequestBody AgendamentoRequest request) {
        log.info("POST /agendamentos");
        return mapper.toResponse(service.createAgendamento(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public AgendamentoResponse updateAgendamento(@Valid @RequestBody AgendamentoRequest request,
            @PathVariable Long id) {
        log.info("PUT /agendamentos - atualizando convênio ID {}", id);
        return mapper.toResponse(service.editAgendamento(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> deleteAgendamento(@PathVariable Long id) {
        log.info("DELETE /agendamentos - excluindo convênio ID {}", id);
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreAgendamento(@PathVariable Long id) {
        log.info("PATCH /agendamentos/{}/restaurar", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AgendamentoResponse getAgendamentoById(@PathVariable Long id) {
        log.info("GET /agendamentos/{} - buscando agendamento pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }
}
