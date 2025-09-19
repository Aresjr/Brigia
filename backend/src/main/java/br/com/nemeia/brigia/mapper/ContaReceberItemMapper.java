package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.response.ContaReceberItemResponse;
import br.com.nemeia.brigia.model.ContaReceberItem;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ContaReceberItemMapper {

    private final ProcedimentoMapper procedimentoMapper;
    private final ConvenioMapper convenioMapper;

    public ContaReceberItemResponse toResponse(ContaReceberItem item) {
        if (item == null) {
            return null;
        }

        return new ContaReceberItemResponse(item.getId(), procedimentoMapper.toResponse(item.getProcedimento()),
                item.getQuantidade(), convenioMapper.toResponse(item.getConvenio()), item.getValor());
    }
}
