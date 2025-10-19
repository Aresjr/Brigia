package br.com.nemeia.brigia.controller;

import br.com.nemeia.brigia.dto.request.DescontoRequest;
import br.com.nemeia.brigia.dto.request.RecebimentoRequest;
import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.mapper.ContaReceberMapper;
import br.com.nemeia.brigia.service.ContaReceberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/contas-receber")
@RequiredArgsConstructor
@Slf4j
public class ContaReceberController {

    private final ContaReceberService service;
    private final ContaReceberMapper mapper;

    @GetMapping
    @PreAuthorize("hasAuthority('FATURAMENTO') or hasAuthority('ADMIN')")
    public PagedResponse<ContaReceberResponse> getAllContasReceber(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        log.info("GET /contas-receber - page: {}, size: {}", page, size);
        return mapper.toPagedResponse(service.getPaged(page, size));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('FATURAMENTO') or hasAuthority('ADMIN')")
    public ContaReceberResponse getContaReceberById(@PathVariable Long id) {
        log.info("GET /contas-receber/{} - buscando conta a receber pelo ID", id);
        return mapper.toResponse(service.getById(id));
    }

    @PostMapping("/registrar-recebimento/{contaReceberId}")
    @PreAuthorize("hasAuthority('FATURAMENTO') or hasAuthority('ADMIN')")
    public ContaReceberResponse registrarRecebimento(@PathVariable Long contaReceberId,
            @Valid @RequestBody RecebimentoRequest request) {
        log.info("POST /agendamentos/registrar-recebimento/{}", contaReceberId);
        return mapper.toResponse(service.registrarRecebimento(contaReceberId, request.valorRecebido()));
    }

    @PostMapping("/gerar-pdf")
    @PreAuthorize("hasAuthority('FATURAMENTO') or hasAuthority('ADMIN')")
    public ResponseEntity<byte[]> gerarPDF(@RequestBody Map<String, List<Long>> request) {
        log.info("POST /contas-receber/gerar-pdf - ids: {}", request.get("ids"));
        List<Long> ids = request.get("ids");
        byte[] pdf = service.gerarPDF(ids);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "contas-receber.pdf");

        return ResponseEntity.ok().headers(headers).body(pdf);
    }

    @PatchMapping("/{id}/desconto")
    @PreAuthorize("hasAuthority('FATURAMENTO') or hasAuthority('ADMIN')")
    public ContaReceberResponse atualizarDesconto(@PathVariable Long id, @Valid @RequestBody DescontoRequest request) {
        log.info("PATCH /contas-receber/{}/desconto - atualizando desconto para: {}", id, request.desconto());
        return mapper.toResponse(service.atualizarDesconto(id, request.desconto()));
    }

}
