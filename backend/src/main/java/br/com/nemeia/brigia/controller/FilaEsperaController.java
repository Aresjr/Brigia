package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.FilaEsperaRequest;
import br.com.nemeia.brigia.dto.response.FilaEsperaResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.FilaEsperaMapper;
import br.com.nemeia.brigia.service.FilaEsperaService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/fila-espera")
@RequiredArgsConstructor
@Slf4j
public class FilaEsperaController {

    private final FilaEsperaService service;
    private final FilaEsperaMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<FilaEsperaResponse> getAll(@RequestParam(defaultValue = "0") int page,
                                                      @RequestParam(defaultValue = "50") int size) {
        log.info("GET /fila-espera - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public FilaEsperaResponse create(@Valid @RequestBody FilaEsperaRequest request) {
        log.info("POST /fila-espera");
        return mapper.toResponse(service.create(request));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public FilaEsperaResponse getById(@PathVariable Long id) {
        log.info("GET /fila-espera/{} - buscando registro por ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public FilaEsperaResponse update(@Valid @RequestBody FilaEsperaRequest request, @PathVariable Long id) {
        log.info("PUT /fila-espera - atualizando registro ID {}", id);
        return mapper.toResponse(service.edit(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('ADMIN')")
    public void delete(@PathVariable Long id) {
        log.info("DELETE /fila-espera/{} - removendo registro", id);
        service.delete(id);
    }
}
