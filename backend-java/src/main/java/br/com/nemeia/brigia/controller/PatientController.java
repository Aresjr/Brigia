package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.exception.PatientNotFoundException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@RestController
@RequestMapping("/patients")
public class PatientController {

    @GetMapping
    public List<String> getAllPatients() {

        throw new PatientNotFoundException("Patient list not found");

        //return List.of("Patient list will be implemented here");
    }
}
