package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.EspecialidadeRequest;
import br.com.nemeia.brigia.dto.response.EspecialidadeResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.EspecialidadeMapper;
import br.com.nemeia.brigia.service.EspecialidadeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/especialidades")
@RequiredArgsConstructor
@Slf4j
public class EspecialidadeController {

  private final EspecialidadeService service;
  private final EspecialidadeMapper mapper;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PagedResponse<EspecialidadeResponse> getAllEspecialidades(
      @RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "20") int size) {
    log.info("GET /especialidades - page: {}, size: {}", page, size);
    return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
  }

  @PostMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public EspecialidadeResponse createEspecialidade(
      @Valid @RequestBody EspecialidadeRequest request) {
    log.info("POST /especialidades");
    return mapper.toResponse(service.createEspecialidade(request));
  }

  @PutMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public EspecialidadeResponse updateEspecialidade(
      @Valid @RequestBody EspecialidadeRequest request, @PathVariable Long id) {
    log.info("PUT /especialidades - atualizando especialidade ID {}", id);
    return mapper.toResponse(service.editEspecialidade(id, request));
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ResponseEntity<Void> deleteEspecialidade(@PathVariable Long id) {
    log.info("DELETE /especialidades - excluindo especialidade ID {}", id);
    service.deleteEspecialidade(id);
    return ResponseEntity.noContent().build();
  }

  @PatchMapping("/{id}/restaurar")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ResponseEntity<Void> restoreEspecialidade(@PathVariable Long id) {
    log.info("PATCH /especialidades/{}/restaurar", id);
    service.restoreEspecialidade(id);
    return ResponseEntity.noContent().build();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public EspecialidadeResponse getEspecialidadeById(@PathVariable Long id) {
    log.info("GET /especialidades/{} - buscando especialidade pelo ID", id);
    return mapper.toResponse(service.getById(id));
  }
}
