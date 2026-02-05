package br.com.nemeia.brigia.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class HorarioDisponvelResponse {
    @JsonProperty("horaInicial")
    private String horaInicial;

    @JsonProperty("horaFinal")
    private String horaFinal;
}
