package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.*;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class ProcedimentoMapper extends BaseMapper<Procedimento, ProcedimentoRequest, ProcedimentoResponse> {

    private final ObjectMapper objectMapper;
    private final EspecialidadeMapper especialidadeMapper;
    private final ConvenioMapper convenioMapper;
    private final EmpresaPlanoMapper empresaPlanoMapper;

    public ProcedimentoMapper(ObjectMapper objectMapper, EspecialidadeMapper especialidadeMapper,
            ConvenioMapper convenioMapper, EmpresaPlanoMapper empresaPlanoMapper) {
        super(objectMapper, Procedimento.class, ProcedimentoResponse.class);
        this.objectMapper = objectMapper;
        this.especialidadeMapper = especialidadeMapper;
        this.convenioMapper = convenioMapper;
        this.empresaPlanoMapper = empresaPlanoMapper;
    }

    public ProcedimentoResponse toResponse(Procedimento procedimento) {
        if (procedimento == null) {
            return null;
        }

        List<PrecoProcedimentoResponse> precosResponse = procedimento.getPrecos().stream().map(this::toResponse)
                .toList();

        List<ProcedimentoPlanoResponse> precosPlanos = new ArrayList<>();
        if (procedimento.getPrecosPlanos() != null) {
            precosPlanos = procedimento.getPrecosPlanos().stream().map(this::toProcedimentoPlanoResponse).toList();
        }

        return new ProcedimentoResponse(procedimento.getId(), procedimento.getNome(), procedimento.getCodigo(),
                procedimento.getObservacoes(), procedimento.getValorPadrao(), procedimento.getValorRepasse(),
                procedimento.getDuracao(), procedimento.getTipo(),
                especialidadeMapper.toResponse(procedimento.getEspecialidade()), procedimento.getCriadoEm(),
                precosResponse, precosPlanos, procedimento.getExcluido());
    }

    public PrecoProcedimentoResponse toPrecoProcedimento(Procedimento procedimento, Convenio convenio) {
        return toResponse(procedimento.getPrecos().stream()
                .filter(preco -> convenio.getId().equals(preco.getConvenio().getId())).findFirst()
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
                precoProcedimento.getCriadoEm(), "", // TODO - colocar nome do usuário
                precoProcedimento.getAtualizadoEm(), "");
    }

    private ProcedimentoPlanoResponse toProcedimentoPlanoResponse(ProcedimentoPlano procedimentoPlano) {
        return new ProcedimentoPlanoResponse(procedimentoPlano.getId(),
                empresaPlanoMapper.toResponse(procedimentoPlano.getPlano()), procedimentoPlano.getPreco(),
                procedimentoPlano.getRepasse());
    }
}
