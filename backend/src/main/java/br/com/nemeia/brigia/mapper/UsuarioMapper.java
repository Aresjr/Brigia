package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.UsuarioResponse;
import br.com.nemeia.brigia.model.Usuario;
import org.springframework.stereotype.Component;

@Component
public class UsuarioMapper {

    public UsuarioResponse toResponse(Usuario usuario) {
        if (usuario == null) {
            return null;
        }

        return new UsuarioResponse(
            usuario.getEmail(),
            usuario.getNome(),
            usuario.getAvatarUrl(),
            usuario.getRoles(),
            usuario.getUnidade() != null ? usuario.getUnidade().getId() : null
        );
    }
}
