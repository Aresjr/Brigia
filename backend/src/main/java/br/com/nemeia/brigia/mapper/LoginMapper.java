package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.LoginResponse;
import br.com.nemeia.brigia.model.Usuario;
import org.springframework.stereotype.Component;

@Component
public class LoginMapper {

    public LoginResponse toLoginResponse(Usuario usuario) {
        return new LoginResponse(usuario.getNome(), usuario.getEmail(), usuario.getAvatarUrl(), usuario.getRoles(),
                usuario.getUnidade() != null ? usuario.getUnidade().getId() : null);
    }
}
