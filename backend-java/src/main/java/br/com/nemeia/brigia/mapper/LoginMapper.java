package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.LoginResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Component;

@Component
public class LoginMapper {

    public LoginResponse toLoginResponse(String responseBody) {
        JsonObject json = new Gson().fromJson(responseBody, JsonObject.class);
        return new LoginResponse(
                json.get("access_token").getAsString(),
                json.get("user").getAsJsonObject().get("id").getAsString(),
                json.get("user").getAsJsonObject().get("email").getAsString(),
                "Nome",
                "avatar_url",
                "user",
                "light",
                1
        );
    }

}
