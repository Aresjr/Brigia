package br.com.nemeia.brigia.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "a_patients")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "email")
    private String email;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "cpf")
    private String cpf;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(name = "sex", length = 1)
    private String sex;

    @Column(name = "cellphone")
    private String cellphone;

    @Column(name = "last_appointment")
    private LocalDateTime lastAppointment;

    @Column(name = "next_appointment")
    private LocalDateTime nextAppointment;

    @Column(name = "is_deleted")
    private Boolean isDeleted;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "identification_color")
    private String identificationColor;

    @Column(name = "address_cep")
    private String addressCep;

    @Column(name = "address_rua")
    private String addressRua;

    @Column(name = "address_complemento")
    private String addressComplemento;

    @Column(name = "address_bairro")
    private String addressBairro;

    @Column(name = "address_cidade")
    private String addressCidade;

    @Column(name = "address_uf")
    private String addressUf;

    @Column(name = "medical_plan_id")
    private Integer medicalPlanId;

}
