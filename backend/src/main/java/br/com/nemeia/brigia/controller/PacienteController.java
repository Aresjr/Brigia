package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PacientesTotaisResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.PacienteMapper;
import br.com.nemeia.brigia.service.PacienteService;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/pacientes")
@RequiredArgsConstructor
@Slf4j
public class PacienteController {

    private final PacienteService service;
    private final PacienteMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PagedResponse<PacienteResponse> getAllPacientes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /pacientes - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacienteResponse createPaciente(@Valid @RequestBody PacienteRequest request) {
        log.info("POST /pacientes");
        return mapper.toResponse(service.createPaciente(request));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacienteResponse getPacienteById(@PathVariable Long id) {
        log.info("GET /pacientes/{} - buscando paciente por ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacienteResponse updatePaciente(
            @Valid @RequestBody PacienteRequest request, @PathVariable Long id) {
        log.info("PUT /pacientes - atualizando paciente ID {}", id);
        return mapper.toResponse(service.editPaciente(id, request));
    }

    @GetMapping("/total")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacientesTotaisResponse countPacientes(
            @RequestParam(defaultValue = "false") Boolean excluido) {
        log.info("GET /pacientes/total");
        return new PacientesTotaisResponse(service.getTotal(excluido));
    }

    @GetMapping("/aniversariantes")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public List<PacienteResponse> aniversariantes() {
        log.info("GET /pacientes/aniversariantes");
        return service.getAniversariantes().stream().map(mapper::toResponse).toList();
    }
}
