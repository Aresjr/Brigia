package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.response.PacienteResponse;
import br.com.nemeia.brigia.dto.response.PacientesTotaisResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.service.PacienteService;
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

  private final PacienteService pacienteService;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PagedResponse<PacienteResponse> getAllPatients(
      @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    log.info("GET /pacientes - page: {}, size: {}", page, size);
    return pacienteService.getPaged(page, size);
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PacienteResponse getPatientById(@PathVariable Long id) {
    log.info("GET /pacientes/{} - buscando paciente por ID", id);
    return pacienteService.getPatientById(id);
  }

  @GetMapping("/total")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PacientesTotaisResponse countPatients(
      @RequestParam(defaultValue = "false") Boolean excluido) {
    log.info("GET /pacientes/total");
    return new PacientesTotaisResponse(pacienteService.getTotal(excluido));
  }

  @GetMapping("/aniversariantes")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public List<PacienteResponse> aniversariantes() {
    log.info("GET /pacientes/aniversariantes");
    return pacienteService.getAniversariantes();
  }
}
