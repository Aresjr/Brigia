package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.UsuarioResponse;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.service.UsuarioService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usuarios")
@RequiredArgsConstructor
@Slf4j
public class UsuarioController {

    private final UsuarioService service;
    private final UsuarioMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public PagedResponse<UsuarioResponse> getAll(@RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
            @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
        log.info("GET /usuarios");
        return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public UsuarioResponse getById(@PathVariable Long id) {
        log.info("GET /usuarios/{} - buscando usuario pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @GetMapping("/token/{token}")
    public UsuarioResponse getByToken(@PathVariable String token) throws BadRequestException {
        log.info("GET /usuarios/{} - buscando usuario pelo token", token);
        return mapper.toResponse(service.getByToken(token));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public UsuarioResponse post(@Valid @RequestBody UsuarioRequest request) {
        log.info("POST /usuarios - criando novo usuario");
        return mapper.toResponse(service.create(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public UsuarioResponse update(@Valid @RequestBody UsuarioRequest request, @PathVariable Long id) {
        log.info("PUT /usuarios - atualizando usuario ID {}", id);
        return mapper.toResponse(service.edit(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        log.info("DELETE /usuarios - excluindo convênio ID {}", id);
        service.delete(id, false);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<Void> restaurar(@PathVariable Long id) {
        log.info("PATCH /usuarios/{}/restaurar", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }

}
