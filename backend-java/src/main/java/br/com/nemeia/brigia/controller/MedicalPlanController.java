package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.MedicalPlanResponse;
import br.com.nemeia.brigia.service.MedicalPlanService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/medical-plans")
@RequiredArgsConstructor
@Slf4j
public class MedicalPlanController {

    private final MedicalPlanService medicalPlanService;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public List<MedicalPlanResponse> getAllMedicalPlans() {
        log.info("GET /medical-plans");
        return medicalPlanService.getAll();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
    public MedicalPlanResponse getMedicalPlanById(@PathVariable Integer id) {
        log.info("GET /medical-plans/{} - fetching medical plan by ID", id);
        return medicalPlanService.getById(id);
    }
}