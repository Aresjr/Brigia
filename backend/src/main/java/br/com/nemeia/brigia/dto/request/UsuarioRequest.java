package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.RoleUsuario;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import java.util.List;

public record UsuarioRequest(
    @Email(message = "O email deve ser válido") @NotBlank(message = "O email é obrigatório")
        String email,
    @Size(min = 6, message = "A senha deve ter no mínimo 6 caracteres")
        @NotBlank(message = "A senha é obrigatória")
        String senha,
    @NotBlank(message = "O nome é obrigatório") String nome,
    String avatarUrl,
    @NotEmpty(message = "O nível de acesso é obrigatório") List<RoleUsuario> roles,
    Long unidade) {}
