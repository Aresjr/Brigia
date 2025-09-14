package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.RoleUsuario;
import java.util.List;

public record UsuarioResponse(String email, String nome, String avatarUrl, List<RoleUsuario> roles, Long unidade) {
}
