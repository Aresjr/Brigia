package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.ProcedimentoRequest;
import br.com.nemeia.brigia.dto.response.*;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.Procedimento;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@Component
public class ProcedimentoMapper {

  private final EspecialidadeMapper especialidadeMapper;
  private final ConvenioMapper convenioMapper;
  private final UnidadeMapper unidadeMapper;
  private final EmpresaPlanoMapper empresaPlanoMapper;

  public ProcedimentoResponse toResponse(Procedimento procedimento) {
    if (procedimento == null) {
      return null;
    }

    return new ProcedimentoResponse(
        procedimento.getId(),
        procedimento.getNome(),
        procedimento.getCodigo(),
        procedimento.getValorPadrao(),
        especialidadeMapper.toResponse(procedimento.getEspecialidade()),
        procedimento.getObservacoes(),
        procedimento.getCriadoEm(),
        procedimento.getExcluido());
  }

  public PagedResponse<ProcedimentoResponse> toPagedResponse(Page<Procedimento> paged) {
    List<ProcedimentoResponse> responses =
        paged.getContent().stream().map(this::toResponse).toList();
    return new PagedResponse<>(
        responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
  }

  public Procedimento toEntity(ProcedimentoRequest request) {
    return new Procedimento(
        request.codigo(), request.nome(), request.observacoes(), request.valorPadrao());
  }

  public TabelaPrecoResponse toTabelaPreco(Procedimento procedimento) {
    List<PrecoProcedimentoResponse> tabelaConvenio = new ArrayList<>();

    procedimento
        .getPrecos()
        .forEach(
            precoProcedimento -> {
              if (precoProcedimento.getConvenio() != null) {
                var ppr = toResponse(
                        precoProcedimento,
                        convenioMapper.toResponse(precoProcedimento.getConvenio()),
                        null,
                        unidadeMapper.toResponse(precoProcedimento.getUnidade()));
                tabelaConvenio.add(ppr);
              }
            });

    return new TabelaPrecoResponse(toResponse(procedimento), tabelaConvenio);
  }

private PrecoProcedimentoResponse toResponse(PrecoProcedimento precoProcedimento, ConvenioResponse convenio,
                                                   EmpresaPlanoResponse empresa, UnidadeResponse unidade) {
    return new PrecoProcedimentoResponse(
            precoProcedimento.getId(),
            precoProcedimento.getPreco(),
            precoProcedimento.getRepasse(),
            convenio,
            empresa,
            unidade,
            precoProcedimento.getCriadoEm(),
            "", // TODO - colocar nome do usuário
            precoProcedimento.getAtualizadoEm(),
            "");
}
}
