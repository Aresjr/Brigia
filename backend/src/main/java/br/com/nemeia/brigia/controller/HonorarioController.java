package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.HonorarioRequest;
import br.com.nemeia.brigia.dto.response.HonorarioResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.HonorarioMapper;
import br.com.nemeia.brigia.model.Honorario;
import br.com.nemeia.brigia.service.HonorarioService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/honorarios")
@AllArgsConstructor
public class HonorarioController {

    private final HonorarioService service;
    private final HonorarioMapper mapper;

    @GetMapping
    public ResponseEntity<PagedResponse<HonorarioResponse>> getAll(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "50") int size,
            @RequestParam(defaultValue = "false") Boolean mostrarExcluidos) {
        Page<Honorario> paged = service.getPaged(page, size, mostrarExcluidos);
        return ResponseEntity.ok(mapper.toPagedResponse(paged));
    }

    @GetMapping("/{id}")
    public ResponseEntity<HonorarioResponse> getById(@PathVariable Long id) {
        Honorario honorario = service.getById(id);
        return ResponseEntity.ok(mapper.toResponse(honorario));
    }

    @PostMapping
    public ResponseEntity<HonorarioResponse> create(@RequestBody HonorarioRequest request) {
        Honorario honorario = service.gerarHonorario(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(mapper.toResponse(honorario));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}/restore")
    public ResponseEntity<Void> restore(@PathVariable Long id) {
        service.restore(id);
        return ResponseEntity.noContent().build();
    }
}
