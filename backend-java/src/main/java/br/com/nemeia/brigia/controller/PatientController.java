package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PatientCountResponse;
import br.com.nemeia.brigia.dto.PacienteResponse;
import br.com.nemeia.brigia.service.PatientService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/patients")
@RequiredArgsConstructor
@Slf4j
public class PatientController {

    private final PatientService patientService;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PagedResponse<PacienteResponse> getAllPatients(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        log.info("GET /patients - page: {}, size: {}", page, size);
        return patientService.getPaged(page, size);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PacienteResponse getPatientById(
            @PathVariable Long id
    ) {
        log.info("GET /patients/{} - fetching patient by ID", id);
        return patientService.getPatientById(id);
    }

    @GetMapping("/count")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PatientCountResponse countPatients(
            @RequestParam(defaultValue = "false") Boolean isDeleted
    ) {
        log.info("GET /patients/count");
        return new PatientCountResponse(patientService.getTotal(isDeleted));
    }

    @GetMapping("/birthday")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public List<PacienteResponse> birthdayPatients() {
        log.info("GET /patients/birthday");
        return patientService.getBirthdayPatients();
    }
}
