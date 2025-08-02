package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.mapper.ConvenioMapper;
import br.com.nemeia.brigia.service.ConvenioService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/convenios")
@RequiredArgsConstructor
@Slf4j
public class ConvenioController {

  private final ConvenioService service;
  private final ConvenioMapper mapper;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PagedResponse<ConvenioResponse> getAllMedicalPlans(
          @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    log.info("GET /pacientes - page: {}, size: {}", page, size);
    return mapper.toPagedResponse(service.getPaged(page, size));
  }

  @PostMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ConvenioResponse createConvenio(@Valid @RequestBody ConvenioRequest request) {
    log.info("POST /pacientes");
    return mapper.toResponse(service.createConvenio(request));
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ConvenioResponse getConvenioById(@PathVariable Long id) {
    log.info("GET /convenios/{} - buscando convenio pelo ID", id);
    return mapper.toResponse(service.getById(id));
  }
}
