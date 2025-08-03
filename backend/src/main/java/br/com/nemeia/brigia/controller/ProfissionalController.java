package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.dto.response.ProfissionalResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.ProfissionalMapper;
import br.com.nemeia.brigia.service.ProfissionalService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profissionais")
@RequiredArgsConstructor
@Slf4j
public class ProfissionalController {

  private final ProfissionalService service;
  private final ProfissionalMapper mapper;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PagedResponse<ProfissionalResponse> getAllProfissionais(
      @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    log.info("GET /profissionais - page: {}, size: {}", page, size);
    return mapper.toPagedResponse(service.getPaged(page, size));
  }

  @PostMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProfissionalResponse createProfissional(@Valid @RequestBody ProfissionalRequest request) {
    log.info("POST /profissionais");
    return mapper.toResponse(service.createProfissional(request));
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProfissionalResponse getProfissionalById(@PathVariable Long id) {
    log.info("GET /profissionais/{} - buscando profissional por ID", id);
    return mapper.toResponse(service.getProfissionalById(id));
  }

  @PutMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProfissionalResponse updateProfissional(@Valid @RequestBody ProfissionalRequest request, @PathVariable Long id) {
    log.info("PUT /profissionais - atualizando profissional ID {}", id);
    return mapper.toResponse(service.editProfissional(id, request));
  }

  @GetMapping("/aniversariantes")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public List<ProfissionalResponse> aniversariantes() {
    log.info("GET /profissionais/aniversariantes");
    return service.getAniversariantes().stream().map(mapper::toResponse).toList();
  }
}
