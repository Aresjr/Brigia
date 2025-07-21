package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.MedicalPlanResponse;
import br.com.nemeia.brigia.model.MedicalPlan;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MedicalPlanMapper {

    public MedicalPlanResponse toResponse(MedicalPlan medicalPlan) {
        if (medicalPlan == null) {
            return null;
        }

        return new MedicalPlanResponse(
            medicalPlan.getId(),
            medicalPlan.getName(),
            medicalPlan.getDescription(),
            medicalPlan.getCreatedAt()
        );
    }

    public List<MedicalPlanResponse> toResponseList(List<MedicalPlan> patients) {
        return patients.stream()
                .map(this::toResponse)
                .toList();
    }
}
