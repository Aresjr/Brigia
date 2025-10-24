package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.UnidadeResponse;
import br.com.nemeia.brigia.mapper.UnidadeMapper;
import br.com.nemeia.brigia.service.UnidadeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/unidades")
@RequiredArgsConstructor
@Slf4j
public class UnidadeController {

    private final UnidadeService service;
    private final UnidadeMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('RECEPCIONISTA') or hasAuthority('FATURAMENTO')")
    public PagedResponse<UnidadeResponse> getAll(@RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
            @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
        log.info("GET /unidades - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
    }
}
