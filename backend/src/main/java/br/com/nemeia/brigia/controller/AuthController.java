package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.CadastrarSenhaRequest;
import br.com.nemeia.brigia.dto.request.LoginRequest;
import br.com.nemeia.brigia.dto.response.LoginResponse;
import br.com.nemeia.brigia.service.AuthService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@Slf4j
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request,
            HttpServletResponse httpServletResponse) {
        LoginResponse loginResponse = authService.login(request, httpServletResponse);
        return ResponseEntity.ok(loginResponse);
    }

    @PostMapping("/logout")
    public ResponseEntity<Void> logout(HttpServletResponse response) {
        authService.logout(response);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/cadastrar-senha")
    public ResponseEntity<Void> cadastrarSenha(@RequestBody CadastrarSenhaRequest request)
            throws BadRequestException {
        authService.cadastrarSenha(request);
        return ResponseEntity.noContent().build();
    }
}
