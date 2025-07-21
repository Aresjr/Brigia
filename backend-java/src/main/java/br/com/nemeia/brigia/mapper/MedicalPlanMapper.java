package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.MedicalPlanResponse;
import br.com.nemeia.brigia.model.Convenio;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MedicalPlanMapper {

    public MedicalPlanResponse toResponse(Convenio convenio) {
        if (convenio == null) {
            return null;
        }

        return new MedicalPlanResponse(
            convenio.getId(),
            convenio.getNome(),
            convenio.getDescricao(),
            convenio.getCriadoEm()
        );
    }

    public List<MedicalPlanResponse> toResponseList(List<Convenio> patients) {
        return patients.stream()
                .map(this::toResponse)
                .toList();
    }
}
