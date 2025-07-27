package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.LoginResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Component;

@Component
public class LoginMapper {

    public JsonObject toJson(String responseBody) {
        return new Gson().fromJson(responseBody, JsonObject.class);
    }

    public LoginResponse toLoginResponse(JsonObject json) {
        return new LoginResponse(
            "Nome",
            "avatar_url",
            "user",
            "light",
            1
        );
    }

    public String getAccessToken(JsonObject json) {
        return json.get("access_token").getAsString();
    }

}
