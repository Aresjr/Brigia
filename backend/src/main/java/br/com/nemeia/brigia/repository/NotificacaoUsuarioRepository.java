package br.com.nemeia.brigia.repository;

import br.com.nemeia.brigia.model.NotificacaoUsuario;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificacaoUsuarioRepository extends JpaRepository<NotificacaoUsuario, Long> {

    @EntityGraph(attributePaths = "notificacao")
    List<NotificacaoUsuario> findAllByUsuarioIdAndNotificacaoExcluidoFalseOrderByNotificacaoDataNotificacaoDesc(
            Long usuarioId);

    @EntityGraph(attributePaths = "notificacao")
    Optional<NotificacaoUsuario> findByNotificacaoIdAndUsuarioId(Long notificacaoId, Long usuarioId);
}
