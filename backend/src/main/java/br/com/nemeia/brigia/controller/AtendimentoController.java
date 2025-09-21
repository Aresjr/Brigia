package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.AtendimentoRequest;
import br.com.nemeia.brigia.dto.response.AtendimentoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.AtendimentoMapper;
import br.com.nemeia.brigia.service.AtendimentoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/atendimentos")
@RequiredArgsConstructor
@Slf4j
public class AtendimentoController {

    private final AtendimentoService service;
    private final AtendimentoMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('RECEPCIONISTA') or hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public PagedResponse<AtendimentoResponse> getAllAtendimentos(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /atendimentos - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AtendimentoResponse createAtendimento(@Valid @RequestBody AtendimentoRequest request) {
        log.info("POST /atendimentos");
        return mapper.toResponse(service.createAtendimento(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AtendimentoResponse updateAtendimento(@Valid @RequestBody AtendimentoRequest request,
            @PathVariable Long id) {
        log.info("PUT /atendimentos - atualizando atendimento ID {}", id);
        return mapper.toResponse(service.update(request, id));
    }

    @PostMapping("/iniciar-atendimento/{agendamentoId}")
    @PreAuthorize("hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AtendimentoResponse iniciarAtendimento(@PathVariable Long agendamentoId) {
        log.info("POST /agendamentos/iniciar-atendimento/{}", agendamentoId);
        return mapper.toResponse(service.iniciarAtendimento(agendamentoId));
    }

    @PostMapping("/finalizar-atendimento/{id}")
    @PreAuthorize("hasAuthority('MEDICO') or hasAuthority('ADMIN')")
    public AtendimentoResponse finalizarAtendimento(@PathVariable Long id,
            @Valid @RequestBody AtendimentoRequest request) {
        log.info("POST /agendamentos/finalizar-atendimento/{}", id);
        return mapper.toResponse(service.finalizarAtendimento(id, request));
    }
}
