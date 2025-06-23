package br.com.nemeia.brigia.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record PatientResponse(
    Integer id,
    String email,
    LocalDateTime createdAt,
    String cpf,
    LocalDate birthDate,
    String sex,
    String cellphone,
    LocalDateTime lastAppointment,
    LocalDateTime nextAppointment,
    Boolean isDeleted,
    String imageUrl,
    String identificationColor,
    String addressCep,
    String addressRua,
    String addressComplemento,
    String addressBairro,
    String addressCidade,
    String addressUf,
    Integer medicalPlanId
) {}
