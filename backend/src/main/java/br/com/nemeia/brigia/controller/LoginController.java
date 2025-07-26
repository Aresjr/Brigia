package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.LoginRequest;
import br.com.nemeia.brigia.dto.LoginResponse;
import br.com.nemeia.brigia.service.LoginService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request, HttpServletResponse response) {
        LoginResponse loginResponse = loginService.login(request);
        loginService.addAccessTokenToResponse(response, loginResponse.accessToken());
        return ResponseEntity.ok(loginResponse);
    }
}
