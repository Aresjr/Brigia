package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.Empresa;
import br.com.nemeia.brigia.model.Procedimento;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.ProcedimentoPlano;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.repository.PrecoProcedimentoRepository;
import br.com.nemeia.brigia.repository.ProcedimentoPlanoRepository;
import java.math.BigDecimal;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProcedimentoPrecoResolver {

    private final ConvenioService convenioService;
    private final PrecoProcedimentoRepository precoProcedimentoRepository;
    private final ProcedimentoPlanoRepository procedimentoPlanoRepository;

    public ValorProcedimento resolve(Procedimento procedimento, Convenio convenio, Empresa empresa, Unidade unidade) {
        if (procedimento == null) {
            throw new NotFoundException("Procedimento não informado");
        }

        Unidade unidadeReferencia = unidade != null ? unidade : procedimento.getUnidade();

        Optional<ValorProcedimento> valorConvenio = Optional.empty();
        if (convenio != null) {
            valorConvenio = buscarPrecoConvenio(procedimento, convenio, unidadeReferencia);
        }
        if (valorConvenio.isPresent()) {
            return valorConvenio.get();
        }

        Optional<ValorProcedimento> valorPlano = buscarPrecoPlano(procedimento, empresa, unidadeReferencia);
        if (valorPlano.isPresent()) {
            return valorPlano.get();
        }

        Convenio convenioParticular = convenioService.getConvenioParticular();
        return buscarPrecoConvenio(procedimento, convenioParticular, unidadeReferencia)
                .orElseThrow(() -> new NotFoundException(String.format(
                        "Preço não encontrado para procedimento %s na unidade informada.", procedimento.getNome())));
    }

    private Optional<ValorProcedimento> buscarPrecoConvenio(Procedimento procedimento, Convenio convenio,
            Unidade unidade) {
        if (convenio == null) {
            return Optional.empty();
        }

        Optional<PrecoProcedimento> preco = Optional.empty();
        if (unidade != null) {
            preco = precoProcedimentoRepository.findOneByProcedimentoAndConvenioAndUnidade(procedimento.getId(),
                    convenio.getId(), unidade.getId());
        }
        if (preco.isEmpty()) {
            preco = precoProcedimentoRepository.findOneByProcedimentoAndConvenio(procedimento.getId(),
                    convenio.getId());
        }

        return preco.map(pp -> new ValorProcedimento(pp.getPreco(), pp.getRepasse()));
    }

    private Optional<ValorProcedimento> buscarPrecoPlano(Procedimento procedimento, Empresa empresa, Unidade unidade) {
        if (empresa == null || empresa.getPlano() == null) {
            return Optional.empty();
        }

        Long unidadeId = unidade != null ? unidade.getId() : null;
        ProcedimentoPlano planoEspecifico = null;
        if (unidadeId != null) {
            planoEspecifico = procedimentoPlanoRepository
                    .findFirstByProcedimentoIdAndPlanoIdAndUnidadeId(procedimento.getId(), empresa.getPlano().getId(),
                            unidadeId)
                    .orElse(null);
        }
        if (planoEspecifico == null) {
            planoEspecifico = procedimentoPlanoRepository
                    .findFirstByProcedimentoIdAndPlanoIdAndUnidadeIsNull(procedimento.getId(),
                            empresa.getPlano().getId())
                    .orElse(null);
        }

        return Optional.ofNullable(planoEspecifico)
                .map(pp -> new ValorProcedimento(pp.getPreco(), pp.getRepasse()));
    }

    public record ValorProcedimento(BigDecimal valor, BigDecimal repasse) {
        public BigDecimal valor() {
            return valor != null ? valor : BigDecimal.ZERO;
        }

        public BigDecimal repasseOrZero() {
            return repasse != null ? repasse : BigDecimal.ZERO;
        }
    }
}
