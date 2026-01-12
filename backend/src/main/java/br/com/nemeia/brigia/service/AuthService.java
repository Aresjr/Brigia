package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.JwtService;
import br.com.nemeia.brigia.dto.request.CadastrarSenhaRequest;
import br.com.nemeia.brigia.dto.request.LoginRequest;
import br.com.nemeia.brigia.dto.response.LoginResponse;
import br.com.nemeia.brigia.exception.InvalidCredentialsException;
import br.com.nemeia.brigia.mapper.LoginMapper;
import br.com.nemeia.brigia.model.Usuario;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    @Value("${env}")
    private String env;

    private final int tokenExpirationTime = 60 * 60 * 72;

    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final LoginMapper mapper;
    private final UsuarioService usuarioService;

    public LoginResponse login(LoginRequest request, HttpServletResponse httpServletResponse) {
        try {
            Usuario usuario = usuarioService.getByEmail(request.email()).orElseThrow(InvalidCredentialsException::new);

            if (!passwordEncoder.matches(request.password(), usuario.getSenha())) {
                log.error("Senha inválida para o usuário: {}", request.email());
                throw new InvalidCredentialsException();
            }

            String token = jwtService.generateToken(usuario);
            addAccessTokenToResponse(httpServletResponse, token);

            return mapper.toLoginResponse(usuario);
        } catch (InvalidCredentialsException e) {
            log.error("Credenciais inválidas: ", e);
            throw e;
        } catch (Exception e) {
            log.error("Erro ao realizar login: ", e);
            throw new RuntimeException("Serviço de login indisponível, tente novamente mais tarde.");
        }
    }

    public void addAccessTokenToResponse(HttpServletResponse response, String accessToken) {
        Cookie cookie = new Cookie("access-token", accessToken);
        cookie.setHttpOnly(true);
        cookie.setSecure("prod".equals(env));
        cookie.setPath("/");
        cookie.setMaxAge(tokenExpirationTime);
        response.addCookie(cookie);
    }

    public void logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("access-token", null);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    public void cadastrarSenha(CadastrarSenhaRequest request) throws BadRequestException {
        Usuario usuario = usuarioService.getByToken(request.token());
        usuario.setSenha(passwordEncoder.encode(request.senha()));
        usuarioService.save(usuario);
    }

    public boolean validarCredenciaisAdmin(String login, String senha, Long unidadeId) {
        try {
            Usuario usuario = usuarioService.getByEmail(login).orElseThrow(InvalidCredentialsException::new);

            // Validar senha
            if (!passwordEncoder.matches(senha, usuario.getSenha())) {
                log.error("Senha inválida para o usuário: {}", login);
                return false;
            }

            // Validar se é admin
            if (!usuario.getRoles().contains(br.com.nemeia.brigia.model.RoleUsuario.ADMIN)) {
                log.error("Usuário {} não possui role ADMIN", login);
                return false;
            }

            // Validar se pertence à unidade
            if (usuario.getUnidade() == null || !usuario.getUnidade().getId().equals(unidadeId)) {
                log.error("Usuário {} não pertence à unidade {}", login, unidadeId);
                return false;
            }

            return true;
        } catch (Exception e) {
            log.error("Erro ao validar credenciais admin: ", e);
            return false;
        }
    }
}
