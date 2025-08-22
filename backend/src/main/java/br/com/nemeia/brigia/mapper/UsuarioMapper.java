package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.dto.response.UsuarioResponse;
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
                usuario.getUnidade() != null ? usuario.getUnidade().getId() : null);
    }

    public Usuario toEntity(UsuarioRequest request) {
        if (request == null) {
            return null;
        }

        Usuario usuario = new Usuario();
        usuario.setEmail(request.email());
        usuario.setNome(request.nome());
        usuario.setAvatarUrl(request.avatarUrl());
        usuario.setRoles(request.roles());
        return usuario;
    }
}
