package br.com.nemeia.brigia.dto.request;

import com.google.gson.JsonObject;

public record LoginRequest(String email, String password) {

  @Override
  public String toString() {
    JsonObject body = new JsonObject();
    body.addProperty("email", email);
    body.addProperty("password", password);
    return body.toString();
  }
}
