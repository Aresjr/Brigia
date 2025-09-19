package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.StatusAgendamento;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.time.LocalTime;

public record AgendamentoDetalhesResponse(String nomePaciente,
                                          @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate data,
                                          @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime hora,
                                          @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaFim,
                                          String nomeUnidade,
                                          String enderecoUnidade,
                                          String nomeProfissional, StatusAgendamento status) {
}
