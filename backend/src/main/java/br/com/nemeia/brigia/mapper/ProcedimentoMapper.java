package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.Procedimento;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

@Component
public class ProcedimentoMapper extends BaseMapper<Procedimento, ProcedimentoRequest, ProcedimentoResponse> {

    private final ObjectMapper objectMapper;
    private final EspecialidadeMapper especialidadeMapper;
    private final ConvenioMapper convenioMapper;

    public ProcedimentoMapper(ObjectMapper objectMapper, EspecialidadeMapper especialidadeMapper,
            ConvenioMapper convenioMapper) {
        super(objectMapper, Procedimento.class, ProcedimentoResponse.class);
        this.objectMapper = objectMapper;
        this.especialidadeMapper = especialidadeMapper;
        this.convenioMapper = convenioMapper;
    }

    public ProcedimentoResponse toResponse(Procedimento procedimento) {
        if (procedimento == null) {
            return null;
        }

        List<PrecoProcedimentoResponse> precosResponse = procedimento.getPrecos().stream().map(this::toResponse)
                .toList();

        return new ProcedimentoResponse(procedimento.getId(), procedimento.getNome(), procedimento.getCodigo(),
                procedimento.getObservacoes(), procedimento.getValorPadrao(), procedimento.getValorRepasse(),
                procedimento.getDuracao(), procedimento.getTipo(),
                especialidadeMapper.toResponse(procedimento.getEspecialidade()), procedimento.getCriadoEm(),
                precosResponse, procedimento.getExcluido());
    }

    public PrecoProcedimentoResponse toPrecoProcedimento(Procedimento procedimento, Convenio convenio) {
        return toResponse(procedimento.getPrecos().stream()
                .filter(preco -> convenio.getId().equals(preco.getConvenio().getId())).findFirst()
                .orElseThrow(() -> new NotFoundException(
                        String.format("Preço não encontrado para procedimento %s e convênio %s", procedimento.getId(),
                                convenio.getId()))));
    }

    private PrecoProcedimentoResponse toResponse(PrecoProcedimento precoProcedimento) {
        return new PrecoProcedimentoResponse(precoProcedimento.getId(), precoProcedimento.getPreco(),
                precoProcedimento.getRepasse(), convenioMapper.toResponse(precoProcedimento.getConvenio()),
                precoProcedimento.getCriadoEm(), "", // TODO - colocar nome do usuário
                precoProcedimento.getAtualizadoEm(), "");
    }
}
