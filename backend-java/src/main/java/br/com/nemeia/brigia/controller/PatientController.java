package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@RestController
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    private PatientService patientService;

    @GetMapping
    public List<PatientResponse> getAllPatients() {
        return patientService.findAllPatients();
    }
}
