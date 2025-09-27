package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.UsuarioRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.UsuarioResponse;
import br.com.nemeia.brigia.model.Usuario;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@AllArgsConstructor
public class UsuarioMapper {

    private final UnidadeMapper unidadeMapper;

    public UsuarioResponse toResponse(Usuario usuario) {
        if (usuario == null) {
            return null;
        }

        return new UsuarioResponse(usuario.getId(), usuario.getEmail(), usuario.getNome(), usuario.getAvatarUrl(), usuario.getRoles(),
                usuario.getUnidade() != null ? unidadeMapper.toResponse(usuario.getUnidade()) : null);
    }

    public Usuario toEntity(UsuarioRequest request) {
        if (request == null) {
            return null;
        }

        Usuario usuario = new Usuario();
        usuario.setEmail(request.email());
        usuario.setNome(request.nome());
        usuario.setAvatarUrl(request.avatarUrl());
        usuario.setRoles(List.of(request.role()));
        return usuario;
    }

    public PagedResponse<UsuarioResponse> toPagedResponse(Page<Usuario> paged) {
        List<UsuarioResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

}
