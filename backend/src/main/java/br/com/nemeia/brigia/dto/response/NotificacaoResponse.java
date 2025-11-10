package br.com.nemeia.brigia.dto.response;

import java.time.LocalDateTime;

public record NotificacaoResponse(Long id, String titulo, String mensagem, LocalDateTime dataNotificacao, String tipo,
        Boolean lida, LocalDateTime lidaEm) {
}
