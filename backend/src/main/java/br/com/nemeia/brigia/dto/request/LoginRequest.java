package br.com.nemeia.brigia.dto.request;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public record LoginRequest(String email, String password) {

  @Override
  public String toString() {
    ObjectMapper om = new ObjectMapper();
    try {
        return om.writeValueAsString(this);
    } catch (JsonProcessingException e) {
        throw new RuntimeException(e);
    }
  }
}
