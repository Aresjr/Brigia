package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.LoginResponse;
import br.com.nemeia.brigia.model.Usuario;
import org.springframework.stereotype.Component;

@Component
public class LoginMapper {

    public LoginResponse toLoginResponse(Usuario usuario) {
        return new LoginResponse(
            usuario.getNome(),
            usuario.getAvatarUrl(),
            usuario.getRoles(),
            usuario.getUnidade() != null ? usuario.getUnidade().getId() : null
        );
    }

}
