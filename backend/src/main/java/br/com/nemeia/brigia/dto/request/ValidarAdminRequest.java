package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotBlank;

public record ValidarAdminRequest(@NotBlank(message = "Login é obrigatório") String login,
        @NotBlank(message = "Senha é obrigatória") String senha) {
}
