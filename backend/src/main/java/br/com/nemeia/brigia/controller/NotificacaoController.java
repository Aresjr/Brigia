package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.response.NotificacaoResponse;
import br.com.nemeia.brigia.mapper.NotificacaoMapper;
import br.com.nemeia.brigia.service.NotificacaoService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/notificacoes")
@RequiredArgsConstructor
@Slf4j
public class NotificacaoController {

    private final NotificacaoService notificacaoService;
    private final NotificacaoMapper notificacaoMapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public List<NotificacaoResponse> listar() {
        log.info("GET /notificacoes - listando notificações do usuário logado");
        return notificacaoMapper.toResponse(notificacaoService.listarDoUsuarioLogado());
    }

    @PatchMapping("/{id}/ler")
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public ResponseEntity<Void> marcarComoLida(@PathVariable Long id) {
        log.info("PATCH /notificacoes/{}/ler - marcando notificação como lida", id);
        notificacaoService.marcarComoLida(id);
        return ResponseEntity.noContent().build();
    }
}
