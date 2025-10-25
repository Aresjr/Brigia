package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class ProcedimentoMapper extends BaseMapper<Procedimento, ProcedimentoRequest, ProcedimentoResponse> {

    private final ObjectMapper objectMapper;
    private final EspecialidadeMapper especialidadeMapper;
    private final ConvenioMapper convenioMapper;
    private final UnidadeMapper unidadeMapper;
    private final EmpresaPlanoMapper empresaPlanoMapper;

    public ProcedimentoMapper(ObjectMapper objectMapper, EspecialidadeMapper especialidadeMapper,
            ConvenioMapper convenioMapper, UnidadeMapper unidadeMapper, EmpresaPlanoMapper empresaPlanoMapper) {
        super(objectMapper, Procedimento.class, ProcedimentoResponse.class);
        this.objectMapper = objectMapper;
        this.especialidadeMapper = especialidadeMapper;
        this.convenioMapper = convenioMapper;
        this.unidadeMapper = unidadeMapper;
        this.empresaPlanoMapper = empresaPlanoMapper;
    }

    public ProcedimentoResponse toResponse(Procedimento procedimento) {
        if (procedimento == null) {
            return null;
        }

        return new ProcedimentoResponse(procedimento.getId(), procedimento.getNome(), procedimento.getCodigo(),
                procedimento.getObservacoes(), procedimento.getValorPadrao(), procedimento.getValorRepasse(),
                procedimento.getDuracao(), procedimento.getTipo(),
                especialidadeMapper.toResponse(procedimento.getEspecialidade()), procedimento.getCriadoEm(),
                procedimento.getExcluido());
    }

    public PrecoProcedimentoResponse toPrecoProcedimento(Procedimento procedimento, Convenio convenio) {
        Long unidadeId = SecurityHolder.getLoggedUserUnidadeId();
        return toResponse(procedimento.getPrecos().stream()
                .filter(preco -> preco.getUnidade().getId().equals(unidadeId)
                        && convenio.getId().equals(preco.getConvenio().getId()))
                .findFirst()
                .orElseThrow(() -> new NotFoundException(
                        String.format("Preço não encontrado para procedimento %s e convênio %s", procedimento.getId(),
                                convenio.getId()))));
    }

    public ProcedimentoPlanoResponse toPrecoProcedimentoPlano(Procedimento procedimento, EmpresaPlano plano) {
        return toProcedimentoPlanoResponse(
                procedimento.getPrecosPlanos().stream().filter(preco -> plano.getId().equals(preco.getPlano().getId()))
                        .findFirst()
                        .orElseThrow(() -> new NotFoundException(
                                String.format("Preço não encontrado para procedimento %s e plano %s",
                                        procedimento.getId(), plano.getId()))));
    }

    private PrecoProcedimentoResponse toResponse(PrecoProcedimento precoProcedimento) {
        return new PrecoProcedimentoResponse(precoProcedimento.getId(), precoProcedimento.getPreco(),
                precoProcedimento.getRepasse(), convenioMapper.toResponse(precoProcedimento.getConvenio()),
                unidadeMapper.toResponse(precoProcedimento.getUnidade()), precoProcedimento.getCriadoEm(), "",
                precoProcedimento.getAtualizadoEm(), "");
    }

    private ProcedimentoPlanoResponse toProcedimentoPlanoResponse(ProcedimentoPlano procedimentoPlano) {
        return new ProcedimentoPlanoResponse(procedimentoPlano.getId(),
                empresaPlanoMapper.toResponse(procedimentoPlano.getPlano()),
                unidadeMapper.toResponse(procedimentoPlano.getUnidade()), procedimentoPlano.getPreco(),
                procedimentoPlano.getRepasse());
    }

    public java.util.List<PrecoProcedimentoResponse> toPrecosProcedimentoResponse(Procedimento procedimento) {
        if (procedimento == null || procedimento.getPrecos() == null) {
            return java.util.Collections.emptyList();
        }
        return procedimento.getPrecos().stream().map(this::toResponse).collect(java.util.stream.Collectors.toList());
    }

    public java.util.List<ProcedimentoPlanoResponse> toPrecosPlanosResponse(Procedimento procedimento) {
        if (procedimento == null || procedimento.getPrecosPlanos() == null) {
            return java.util.Collections.emptyList();
        }
        return procedimento.getPrecosPlanos().stream().map(this::toProcedimentoPlanoResponse)
                .collect(java.util.stream.Collectors.toList());
    }
}
