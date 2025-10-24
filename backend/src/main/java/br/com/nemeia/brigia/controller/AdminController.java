package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ValidarAdminRequest;
import br.com.nemeia.brigia.service.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
@Slf4j
@RequiredArgsConstructor
public class AdminController {

    private final AuthService authService;

    @PostMapping("/validar-credenciais")
    public ResponseEntity<Boolean> validarCredenciais(@RequestBody ValidarAdminRequest request) {
        Long unidadeId = SecurityHolder.getLoggedUserUnidadeId();
        boolean valido = authService.validarCredenciaisAdmin(request.login(), request.senha(), unidadeId);
        return ResponseEntity.ok(valido);
    }
}
