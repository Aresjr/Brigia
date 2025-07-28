package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.response.ConvenioResponse;
import br.com.nemeia.brigia.service.ConvenioService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/convenios")
@RequiredArgsConstructor
@Slf4j
public class ConvenioController {

  private final ConvenioService convenioService;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public List<ConvenioResponse> getAllMedicalPlans() {
    log.info("GET /convenios");
    return convenioService.getAll();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ConvenioResponse getMedicalPlanById(@PathVariable Long id) {
    log.info("GET /convenios/{} - buscando convenio pelo ID", id);
    return convenioService.getById(id);
  }
}
