package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.PatientResponse;
import br.com.nemeia.brigia.model.Patient;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PatientMapper {

    public PatientResponse toResponse(Patient patient) {
        if (patient == null) {
            return null;
        }

        return new PatientResponse(
            patient.getId(),
            patient.getEmail(),
            patient.getCreatedAt(),
            patient.getCpf(),
            patient.getBirthDate(),
            patient.getSex(),
            patient.getCellphone(),
            patient.getLastAppointment(),
            patient.getNextAppointment(),
            patient.getIsDeleted(),
            patient.getImageUrl(),
            patient.getIdentificationColor(),
            patient.getAddressCep(),
            patient.getAddressRua(),
            patient.getAddressComplemento(),
            patient.getAddressBairro(),
            patient.getAddressCidade(),
            patient.getAddressUf(),
            patient.getMedicalPlanId()
        );
    }

    public List<PatientResponse> toResponseList(List<Patient> patients) {
        return patients.stream()
                .map(this::toResponse)
                .toList();
    }
}
