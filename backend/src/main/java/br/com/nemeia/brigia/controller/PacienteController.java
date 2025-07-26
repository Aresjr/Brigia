package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PacientesTotaisResponse;
import br.com.nemeia.brigia.dto.PacienteResponse;
import br.com.nemeia.brigia.service.PacienteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pacientes")
@RequiredArgsConstructor
@Slf4j
public class PacienteController {

    private final PacienteService pacienteService;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PagedResponse<PacienteResponse> getAllPatients(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        log.info("GET /pacientes - page: {}, size: {}", page, size);
        return pacienteService.getPaged(page, size);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacienteResponse getPatientById(
            @PathVariable Long id
    ) {
        log.info("GET /pacientes/{} - buscando paciente por ID", id);
        return pacienteService.getPatientById(id);
    }

    @GetMapping("/total")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacientesTotaisResponse countPatients(
            @RequestParam(defaultValue = "false") Boolean excluido
    ) {
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
