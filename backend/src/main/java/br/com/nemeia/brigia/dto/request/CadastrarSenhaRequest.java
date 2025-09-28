package br.com.nemeia.brigia.dto.request;

import jakarta.validation.constraints.NotNull;

public record CadastrarSenhaRequest(@NotNull(message = "Token é obrigatório") String token,
        @NotNull(message = "Senha é obrigatória") String senha) {
}
