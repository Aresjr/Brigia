package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.RepasseRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.RepasseResponse;
import br.com.nemeia.brigia.mapper.RepasseMapper;
import br.com.nemeia.brigia.service.RepasseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/repasses")
@RequiredArgsConstructor
@Slf4j
public class RepasseController {

    private final RepasseService service;
    private final RepasseMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public PagedResponse<RepasseResponse> getAllRepasses(
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /repasses - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size, mostrarExcluidos));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public RepasseResponse getRepasseById(@PathVariable Long id) {
        log.info("GET /repasses/{} - buscando repasse pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @GetMapping("/profissional/{profissionalId}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO') or hasAuthority('MEDICO')")
    public List<RepasseResponse> getRepassesByProfissional(@PathVariable Long profissionalId) {
        log.info("GET /repasses/profissional/{} - buscando repasses por profissional", profissionalId);
        return service.findByProfissional(profissionalId).stream()
                .map(mapper::toResponse)
                .toList();
    }

    @GetMapping("/procedimento/{procedimentoId}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public List<RepasseResponse> getRepassesByProcedimento(@PathVariable Long procedimentoId) {
        log.info("GET /repasses/procedimento/{} - buscando repasses por procedimento", procedimentoId);
        return service.findByProcedimento(procedimentoId).stream()
                .map(mapper::toResponse)
                .toList();
    }

    @GetMapping("/unidade/{unidadeId}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public List<RepasseResponse> getRepassesByUnidade(@PathVariable Long unidadeId) {
        log.info("GET /repasses/unidade/{} - buscando repasses por unidade", unidadeId);
        return service.findByUnidade(unidadeId).stream()
                .map(mapper::toResponse)
                .toList();
    }

    @GetMapping("/convenio/{convenioId}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public List<RepasseResponse> getRepassesByConvenio(@PathVariable Long convenioId) {
        log.info("GET /repasses/convenio/{} - buscando repasses por convênio", convenioId);
        return service.findByConvenio(convenioId).stream()
                .map(mapper::toResponse)
                .toList();
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public RepasseResponse createRepasse(@Valid @RequestBody RepasseRequest request) {
        log.info("POST /repasses - criando novo repasse");
        return mapper.toResponse(service.createRepasse(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public RepasseResponse updateRepasse(@Valid @RequestBody RepasseRequest request, @PathVariable Long id) {
        log.info("PUT /repasses/{} - atualizando repasse", id);
        return mapper.toResponse(service.editRepasse(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('FATURAMENTO')")
    public ResponseEntity<Void> deleteRepasse(@PathVariable Long id) {
        log.info("DELETE /repasses/{} - excluindo repasse", id);
        service.delete(id, false);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restaurar")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<Void> restoreRepasse(@PathVariable Long id) {
        log.info("PATCH /repasses/{}/restaurar - restaurando repasse", id);
        service.restore(id);
        return ResponseEntity.noContent().build();
    }
}

