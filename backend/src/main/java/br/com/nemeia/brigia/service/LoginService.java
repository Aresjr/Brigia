package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.LoginRequest;
import br.com.nemeia.brigia.dto.LoginResponse;
import br.com.nemeia.brigia.exception.InvalidCredentialsException;
import br.com.nemeia.brigia.exception.LoginServiceUnavailableException;
import br.com.nemeia.brigia.mapper.LoginMapper;
import com.google.gson.JsonObject;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginService {

    @Value("${supabase.url}")
    private String supabaseUrl;

    @Value("${supabase.key}")
    private String supabaseKey;

    @Value("${env}")
    private String env;

    private final WebClient webClient = WebClient.builder().build();

    private final LoginMapper mapper;

    public LoginResponse login(LoginRequest request, HttpServletResponse httpServletResponse) {
        try {
            String responseBody = webClient.post()
                .uri(supabaseUrl + "/auth/v1/token?grant_type=password")
                .header("apikey", supabaseKey)
                .header("Content-Type", "application/json")
                .bodyValue(request.toString())
                .retrieve()
                .onStatus(status -> !status.is2xxSuccessful(),
                        clientResponse -> clientResponse.bodyToMono(String.class)
                        .flatMap(errorBody -> Mono.error(
                                new InvalidCredentialsException("Usuário e senha inválidos"))))
                .bodyToMono(String.class)
                .block();

            JsonObject response = mapper.toJson(responseBody);
            addAccessTokenToResponse(httpServletResponse, mapper.getAccessToken(response));

            return mapper.toLoginResponse(response);
        } catch (InvalidCredentialsException e) {
            log.error("Credenciais inválidas: ", e);
            throw e;
        } catch (Exception e) {
            log.error("Erro ao realizar login: ", e);
            throw new LoginServiceUnavailableException("Serviço de login indisponível, tente novamente mais tarde.");
        }
    }

    public void addAccessTokenToResponse(HttpServletResponse response, String accessToken) {
        Cookie cookie = new Cookie("sb-access-token", accessToken);
        cookie.setHttpOnly(true);
        cookie.setSecure("prod".equals(env));
        cookie.setPath("/");
        cookie.setMaxAge(3600);

        response.addCookie(cookie);
    }
}
