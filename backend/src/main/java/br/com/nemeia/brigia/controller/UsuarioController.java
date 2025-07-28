package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.dto.response.UsuarioResponse;
import br.com.nemeia.brigia.service.UsuarioService;
import jakarta.validation.Valid;
import java.util.List;
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

  @GetMapping
  @PreAuthorize("hasAuthority('ADMIN')")
  public List<UsuarioResponse> getAllMedicalPlans() {
    log.info("GET /usuarios");
    return service.getAll();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('ADMIN')")
  public UsuarioResponse getMedicalPlanById(@PathVariable Long id) {
    log.info("GET /usuarios/{} - buscando usuario pelo ID", id);
    return service.getById(id);
  }

  @PostMapping
  @PreAuthorize("hasAuthority('ADMIN')")
  public UsuarioResponse createUsuario(@Valid @RequestBody UsuarioRequest request) {
    log.info("POST /usuarios - criando novo usuario");
    return service.create(request);
  }
}
