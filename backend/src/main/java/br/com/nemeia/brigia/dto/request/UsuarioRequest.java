package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.RoleUsuario;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

public record UsuarioRequest(
        @Email(message = "O email deve ser válido") @NotBlank(message = "O email é obrigatório") String email,
        @NotBlank(message = "O nome é obrigatório") String nome, String avatarUrl,
        @NotEmpty(message = "O nível de acesso é obrigatório") RoleUsuario role, Long unidadeId) {
}
