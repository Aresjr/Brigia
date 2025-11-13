package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.NotificacaoResponse;
import br.com.nemeia.brigia.model.Notificacao;
import br.com.nemeia.brigia.model.NotificacaoUsuario;
import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class NotificacaoMapper {

    public NotificacaoResponse toResponse(NotificacaoUsuario notificacaoUsuario) {
        if (notificacaoUsuario == null) {
            return null;
        }

        Notificacao notificacao = notificacaoUsuario.getNotificacao();
        return new NotificacaoResponse(notificacao.getId(), notificacao.getTitulo(), notificacao.getMensagem(),
                notificacao.getDataNotificacao(), notificacao.getTipo(), notificacaoUsuario.getLida(),
                notificacaoUsuario.getLidaEm());
    }

    public List<NotificacaoResponse> toResponse(List<NotificacaoUsuario> notificacoes) {
        return notificacoes.stream().map(this::toResponse).toList();
    }
}
