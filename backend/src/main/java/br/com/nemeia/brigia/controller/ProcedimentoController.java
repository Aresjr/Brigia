package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.dto.response.ProcedimentoResponse;
import br.com.nemeia.brigia.dto.response.TabelaPrecoResponse;
import br.com.nemeia.brigia.mapper.ProcedimentoMapper;
import br.com.nemeia.brigia.model.Procedimento;
import br.com.nemeia.brigia.service.ProcedimentoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/procedimentos")
@RequiredArgsConstructor
@Slf4j
public class ProcedimentoController {

  private final ProcedimentoService service;
  private final ProcedimentoMapper mapper;

  @GetMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public PagedResponse<ProcedimentoResponse> getAllProcedimentos(
      @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    log.info("GET /procedimentos - page: {}, size: {}", page, size);
    return mapper.toPagedResponse(service.getPaged(page, size));
  }

  @PostMapping
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProcedimentoResponse createProcedimento(@Valid @RequestBody ProcedimentoRequest request) {
    log.info("POST /procedimentos");
    return mapper.toResponse(service.createProcedimento(request));
  }

  @PutMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProcedimentoResponse updateProcedimento(
      @Valid @RequestBody ProcedimentoRequest request, @PathVariable Long id) {
    log.info("PUT /procedimentos - atualizando procedimento ID {}", id);
    return mapper.toResponse(service.editProcedimento(id, request));
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ResponseEntity<Void> deleteProcedimento(@PathVariable Long id) {
    log.info("DELETE /procedimentos - excluindo procedimento ID {}", id);
    service.deleteProcedimento(id);
    return ResponseEntity.noContent().build();
  }

  @PatchMapping("/{id}/restaurar")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ResponseEntity<Void> restoreProcedimento(@PathVariable Long id) {
    log.info("PATCH /procedimentos/{}/restaurar", id);
    service.restoreProcedimento(id);
    return ResponseEntity.noContent().build();
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public ProcedimentoResponse getProcedimentoById(@PathVariable Long id) {
    log.info("GET /procedimentos/{} - buscando procedimento pelo ID", id);
    return mapper.toResponse(service.getById(id));
  }

  @GetMapping("/{id}/tabela-preco")
  @PreAuthorize("hasAuthority('RECEPCAO') or hasAuthority('ADMIN')")
  public TabelaPrecoResponse getTabelaPrecoProcedimentoById(@PathVariable Long id) {
    log.info("GET /procedimentos/{} - buscando procedimento pelo ID", id);
      return mapper.toTabelaPreco(service.getById(id));
  }
}
