package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.ConvenioResponse;
import br.com.nemeia.brigia.model.Convenio;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ConvenioMapper {

    public ConvenioResponse toResponse(Convenio convenio) {
        if (convenio == null) {
            return null;
        }

        return new ConvenioResponse(
            convenio.getId(),
            convenio.getNome(),
            convenio.getDescricao(),
            convenio.getCriadoEm()
        );
    }

    public List<ConvenioResponse> toResponseList(List<Convenio> patients) {
        return patients.stream()
                .map(this::toResponse)
                .toList();
    }
}
