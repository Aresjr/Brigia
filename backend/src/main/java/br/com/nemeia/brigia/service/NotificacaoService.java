package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.Notificacao;
import br.com.nemeia.brigia.model.NotificacaoUsuario;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.NotificacaoRepository;
import br.com.nemeia.brigia.repository.NotificacaoUsuarioRepository;
import br.com.nemeia.brigia.repository.UsuarioRepository;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificacaoService {

    private final NotificacaoUsuarioRepository notificacaoUsuarioRepository;
    private final NotificacaoRepository notificacaoRepository;
    private final UsuarioRepository usuarioRepository;

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

    @Transactional
    public void criarNotificacaoParaUnidade(Long unidadeId, String titulo, String mensagem, String tipo) {
        log.info("Criando notificação para unidade {}: {}", unidadeId, titulo);
        
        // Criar a notificação
        Notificacao notificacao = new Notificacao();
        notificacao.setTitulo(titulo);
        notificacao.setMensagem(mensagem);
        notificacao.setDataNotificacao(LocalDateTime.now());
        notificacao.setTipo(tipo);
        notificacao.setUnidade(new Unidade(unidadeId));
        notificacao = notificacaoRepository.save(notificacao);
        
        // Buscar todos os usuários da unidade
        List<Usuario> usuarios = usuarioRepository.findAllByUnidadeId(unidadeId);
        
        // Criar NotificacaoUsuario para cada usuário
        Notificacao notificacaoFinal = notificacao;
        List<NotificacaoUsuario> notificacoesUsuario = usuarios.stream()
                .map(usuario -> {
                    NotificacaoUsuario nu = new NotificacaoUsuario();
                    nu.setNotificacao(notificacaoFinal);
                    nu.setUsuario(usuario);
                    nu.setLida(false);
                    return nu;
                })
                .toList();
        
        notificacaoUsuarioRepository.saveAll(notificacoesUsuario);
        log.info("Notificação criada com sucesso para {} usuários", notificacoesUsuario.size());
    }

    private Long getUsuarioLogado() {
        Long usuarioId = SecurityHolder.getLoggedUserId();
        if (usuarioId == null) {
            throw new NotFoundException("Usuário logado não identificado.");
        }
        return usuarioId;
    }
}
