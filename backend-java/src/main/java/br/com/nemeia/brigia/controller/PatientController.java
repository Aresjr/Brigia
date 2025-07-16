package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.PagedResponse;
import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.service.PatientService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/patients")
@Slf4j
public class PatientController {

    @Autowired
    private PatientService patientService;

    @GetMapping
    public PagedResponse<PatientResponse> getAllPatients(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size
    ) {
        log.info("GET /patients - page: {}, size: {}", page, size);
        return patientService.getAll(page, size);
    }
}
