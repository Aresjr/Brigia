package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.PrecoProcedimentoRequest;
import br.com.nemeia.brigia.model.Convenio;
import br.com.nemeia.brigia.model.PrecoProcedimento;
import br.com.nemeia.brigia.model.Procedimento;
import br.com.nemeia.brigia.model.Unidade;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class PrecoProcedimentoMapper {

    public PrecoProcedimento toPrecoProcedimento(Procedimento procedimento, Convenio convenio, Unidade unidade,
            PrecoProcedimentoRequest request) {
        PrecoProcedimento precoProcedimento = new PrecoProcedimento();
        precoProcedimento.setProcedimento(procedimento);
        precoProcedimento.setConvenio(convenio);
        precoProcedimento.setUnidade(unidade);
        precoProcedimento.setPreco(request.preco());
        precoProcedimento.setRepasse(request.repasse());
        return precoProcedimento;
    }
}
