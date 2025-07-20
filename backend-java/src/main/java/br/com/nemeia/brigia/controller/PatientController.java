package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.service.PatientService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/patients")
@RequiredArgsConstructor
@Slf4j
public class PatientController {

    private final PatientService patientService;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public PagedResponse<PatientResponse> getAllPatients(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        log.info("GET /patients - page: {}, size: {}", page, size);
        return patientService.getAll(page, size);
    }
}
