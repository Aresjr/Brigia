package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "paciente")
public class Paciente extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "id_externo")
    private Long idExterno;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "nome_social")
    private String nomeSocial;

    @Column(name = "pressao_arterial")
    private String pressaoArterial;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "cpf", unique = true)
    private String cpf;

    @Column(name = "documento", unique = true)
    private String documento;

    @Column(name = "data_nascimento", nullable = false)
    private LocalDate dataNascimento;

    @Column(name = "sexo", length = 1)
    private Character sexo;

    @Column(name = "celular", unique = true, length = 11)
    private String celular;

    @Column(name = "celular_2", length = 11)
    private String celular2;

    @Column(name = "fixo", length = 11)
    private String fixo;

    @Column(name = "fixo_2", length = 11)
    private String fixo2;

    @Column(name = "profissao")
    private String profissao;

    @Column(name = "ultima_consulta")
    private LocalDateTime ultimaConsulta;

    @Column(name = "proxima_consulta")
    private LocalDateTime proximaConsulta;

    @Column(name = "url_imagem")
    private String urlImagem;

    @Column(name = "cor_identificacao")
    private String corIdentificacao;

    @Column(name = "cep", length = 8)
    private String cep;

    @Column(name = "rua")
    private String rua;

    @Column(name = "complemento")
    private String complemento;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "cidade")
    private String cidade;

    @Column(name = "uf")
    private String uf;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "convenio_id")
    private Convenio convenio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id")
    private Empresa empresa;

    @Column(name = "observacoes", columnDefinition = "TEXT")
    private String observacoes;
}