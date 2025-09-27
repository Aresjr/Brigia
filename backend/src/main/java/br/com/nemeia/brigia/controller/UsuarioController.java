package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.UsuarioResponse;
import br.com.nemeia.brigia.mapper.UsuarioMapper;
import br.com.nemeia.brigia.service.UsuarioService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public UsuarioResponse createUsuario(@Valid @RequestBody UsuarioRequest request) {
        log.info("POST /usuarios - criando novo usuario");
        return mapper.toResponse(service.create(request));
    }
}
