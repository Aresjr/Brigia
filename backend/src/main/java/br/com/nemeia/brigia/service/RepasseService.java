package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.dto.request.RepasseRequest;
import br.com.nemeia.brigia.exception.RepasseJaExistenteException;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.RepasseRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class RepasseService extends BaseService<Repasse, RepasseRepository> {

    private final RepasseRepository repository;
    private final ProcedimentoService procedimentoService;
    private final UnidadeService unidadeService;
    private final ConvenioService convenioService;
    private final ProfissionalService profissionalService;

    public RepasseService(RepasseRepository repository, ProcedimentoService procedimentoService,
                         UnidadeService unidadeService, ConvenioService convenioService,
                         ProfissionalService profissionalService) {
        super(repository);
        this.repository = repository;
        this.procedimentoService = procedimentoService;
        this.unidadeService = unidadeService;
        this.convenioService = convenioService;
        this.profissionalService = profissionalService;
    }

    @Transactional
    public Repasse createRepasse(RepasseRequest request) {
        validarUnicidade(request.procedimentoId(), request.unidadeId(),
                        request.convenioId(), request.profissionalId(), null);

        Procedimento procedimento = procedimentoService.getById(request.procedimentoId());
        Unidade unidade = unidadeService.getById(request.unidadeId());
        Convenio convenio = convenioService.getById(request.convenioId());
        Profissional profissional = profissionalService.getById(request.profissionalId());

        Repasse repasse = new Repasse();
        repasse.setProcedimento(procedimento);
        repasse.setUnidade(unidade);
        repasse.setConvenio(convenio);
        repasse.setProfissional(profissional);
        repasse.setValor(request.valor());
        repasse.setPercentual(request.percentual());
        repasse.setObservacoes(request.observacoes());

        return repository.save(repasse);
    }

    @Transactional
    public Repasse editRepasse(Long id, RepasseRequest request) {
        Repasse repasse = getById(id);

        validarUnicidade(request.procedimentoId(), request.unidadeId(),
                        request.convenioId(), request.profissionalId(), id);

        if (!repasse.getProcedimento().getId().equals(request.procedimentoId())) {
            Procedimento procedimento = procedimentoService.getById(request.procedimentoId());
            repasse.setProcedimento(procedimento);
        }

        if (!repasse.getUnidade().getId().equals(request.unidadeId())) {
            Unidade unidade = unidadeService.getById(request.unidadeId());
            repasse.setUnidade(unidade);
        }

        if (!repasse.getConvenio().getId().equals(request.convenioId())) {
            Convenio convenio = convenioService.getById(request.convenioId());
            repasse.setConvenio(convenio);
        }

        if (!repasse.getProfissional().getId().equals(request.profissionalId())) {
            Profissional profissional = profissionalService.getById(request.profissionalId());
            repasse.setProfissional(profissional);
        }

        repasse.setValor(request.valor());
        repasse.setPercentual(request.percentual());
        repasse.setObservacoes(request.observacoes());

        return repository.save(repasse);
    }

    public List<Repasse> findByProfissional(Long profissionalId) {
        return repository.findByProfissional(profissionalId);
    }

    public List<Repasse> findByProcedimento(Long procedimentoId) {
        return repository.findByProcedimento(procedimentoId);
    }

    public List<Repasse> findByUnidade(Long unidadeId) {
        return repository.findByUnidade(unidadeId);
    }

    public List<Repasse> findByConvenio(Long convenioId) {
        return repository.findByConvenio(convenioId);
    }

    private void validarUnicidade(Long procedimentoId, Long unidadeId,
                                   Long convenioId, Long profissionalId, Long idAtual) {
        Optional<Repasse> existente = repository.findByProcedimentoAndUnidadeAndConvenioAndProfissional(
                procedimentoId, unidadeId, convenioId, profissionalId);

        if (existente.isPresent() && (idAtual == null || !existente.get().getId().equals(idAtual))) {
            throw new RepasseJaExistenteException();
        }
    }

    @Override
    String getNomeEntidade() {
        return "Repasse";
    }
}

