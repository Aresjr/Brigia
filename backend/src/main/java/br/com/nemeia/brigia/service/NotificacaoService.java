package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.NotificacaoUsuario;
import br.com.nemeia.brigia.repository.NotificacaoUsuarioRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class NotificacaoService {

    private final NotificacaoUsuarioRepository notificacaoUsuarioRepository;

    @Transactional(readOnly = true)
    public List<NotificacaoUsuario> listarDoUsuarioLogado() {
        Long usuarioId = getUsuarioLogado();
        return notificacaoUsuarioRepository
                .findAllByUsuarioIdAndNotificacaoExcluidoFalseOrderByNotificacaoDataNotificacaoDesc(usuarioId);
    }

    @Transactional
    public void marcarComoLida(Long notificacaoId) {
        Long usuarioId = getUsuarioLogado();
        NotificacaoUsuario notificacaoUsuario = notificacaoUsuarioRepository
                .findByNotificacaoIdAndUsuarioId(notificacaoId, usuarioId)
                .orElseThrow(() -> new NotFoundException("Notificação não encontrada para o usuário logado."));
        notificacaoUsuario.marcarComoLida();
        notificacaoUsuarioRepository.save(notificacaoUsuario);
    }

    private Long getUsuarioLogado() {
        Long usuarioId = SecurityHolder.getLoggedUserId();
        if (usuarioId == null) {
            throw new NotFoundException("Usuário logado não identificado.");
        }
        return usuarioId;
    }
}
