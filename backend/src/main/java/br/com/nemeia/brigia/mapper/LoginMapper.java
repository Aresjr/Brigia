package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.LoginResponse;
import br.com.nemeia.brigia.dto.UsuarioResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Component;

@Component
public class LoginMapper {

    public LoginResponse toLoginResponse(UsuarioResponse usuario) {
        return new LoginResponse(
            usuario.nome(),
            usuario.avatarUrl(),
            usuario.roles(),
            usuario.unidade()
        );
    }

    public String getAccessToken(String responseBody) {
        JsonObject json = new Gson().fromJson(responseBody, JsonObject.class);
        return json.get("access_token").getAsString();
    }

}
