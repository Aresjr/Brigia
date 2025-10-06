package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProcedimentoMapper;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.ProcedimentoRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProcedimentoService {

    private final ProcedimentoRepository repository;
    private final ProcedimentoMapper mapper;
    private final EspecialidadeService especialidadeService;
    private final ConvenioService convenioService;
    private final PrecoProcedimentoService precoProcedimentoService;
    private final EmpresaPlanoService empresaPlanoService;

    public Page<Procedimento> getPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);
        return repository.findAll(pageable);
    }

    public Procedimento getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Procedimento não encontrado com ID: " + id));
    }

    public Procedimento createProcedimento(ProcedimentoRequest request) {
        Especialidade especialidade = especialidadeService.getById(request.especialidadeId());
        Procedimento procedimento = mapper.toEntity(request);
        procedimento.setEspecialidade(especialidade);
        procedimento.setPrecosPlanos(new java.util.ArrayList<>());

        Procedimento procedimentoNovo = repository.save(procedimento);

        // Salvar preços por convênio
        if (request.precosConvenios() != null) {
            request.precosConvenios().forEach(precoProcedimento -> {
                Convenio convenio = convenioService.getById(precoProcedimento.convenioId());
                precoProcedimentoService.save(procedimentoNovo, convenio, precoProcedimento);
            });
        }

        // Salvar preços por plano
        if (request.precosPlanos() != null) {
            request.precosPlanos().forEach(precoPlano -> {
                EmpresaPlano plano = empresaPlanoService.getById(precoPlano.planoId());
                ProcedimentoPlano procedimentoPlano = new ProcedimentoPlano(
                    procedimentoNovo,
                    plano,
                    precoPlano.preco(),
                    precoPlano.repasse()
                );
                procedimentoNovo.getPrecosPlanos().add(procedimentoPlano);
            });
            repository.save(procedimentoNovo);
        }

        return procedimentoNovo;
    }

    public Procedimento editProcedimento(Long id, ProcedimentoRequest request) {
        Especialidade especialidade = especialidadeService.getById(request.especialidadeId());
        Procedimento existing = getById(id);

        Procedimento procedimento = mapper.toEntity(request);
        procedimento.setId(id);
        procedimento.setEspecialidade(especialidade);

        // Limpar preços por plano existentes
        if (existing.getPrecosPlanos() != null) {
            existing.getPrecosPlanos().clear();
        }
        procedimento.setPrecosPlanos(existing.getPrecosPlanos() != null ? existing.getPrecosPlanos() : new java.util.ArrayList<>());

        Procedimento procedimentoAtualizado = repository.save(procedimento);

        // Salvar preços por convênio
        if (request.precosConvenios() != null) {
            request.precosConvenios().forEach(precoProcedimento -> {
                Convenio convenio = convenioService.getById(precoProcedimento.convenioId());
                precoProcedimentoService.save(procedimentoAtualizado, convenio, precoProcedimento);
            });
        }

        // Salvar preços por plano
        if (request.precosPlanos() != null) {
            request.precosPlanos().forEach(precoPlano -> {
                EmpresaPlano plano = empresaPlanoService.getById(precoPlano.planoId());
                ProcedimentoPlano procedimentoPlano = new ProcedimentoPlano(
                    procedimentoAtualizado,
                    plano,
                    precoPlano.preco(),
                    precoPlano.repasse()
                );
                procedimentoAtualizado.getPrecosPlanos().add(procedimentoPlano);
            });
            repository.save(procedimentoAtualizado);
        }

        return procedimentoAtualizado;
    }

    public void deleteProcedimento(Long id) {
        Procedimento procedimento = getById(id);
        procedimento.setExcluido(true);
        procedimento.setExcluidoEm(LocalDateTime.now());

        Long userId = SecurityHolder.getLoggedUserId();
        procedimento.setExcluidoPor(userId);
        repository.save(procedimento);
    }

    public void restoreProcedimento(Long id) {
        Procedimento procedimento = getById(id);
        procedimento.setExcluido(false);
        procedimento.setExcluidoEm(null);
        procedimento.setExcluidoPor(null);
        repository.save(procedimento);
    }
}
