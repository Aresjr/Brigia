package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.PacienteRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.transaction.annotation.Transactional;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@DisplayName("PacienteService - Teste de Integração com Banco de Dados")
class PacienteServiceIntegrationTest {

    @Container
    static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>("postgres:16-alpine")
            .withDatabaseName("brigia_test")
            .withUsername("test")
            .withPassword("test");

    @DynamicPropertySource
    static void configureProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", postgres::getJdbcUrl);
        registry.add("spring.datasource.username", postgres::getUsername);
        registry.add("spring.datasource.password", postgres::getPassword);
        registry.add("spring.jpa.hibernate.ddl-auto", () -> "create-drop");
        registry.add("spring.flyway.enabled", () -> "false");
    }

    @Autowired
    private PacienteService pacienteService;

    @Autowired
    private PacienteRepository pacienteRepository;

    @Autowired
    private UnidadeRepository unidadeRepository;

    @Autowired
    private ConvenioRepository convenioRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    private Unidade unidade;
    private Convenio convenio;
    private Empresa empresa;

    @BeforeEach
    @Transactional
    void setUp() {
        // Limpa os dados antes de cada teste
        pacienteRepository.deleteAll();
        convenioRepository.deleteAll();
        empresaRepository.deleteAll();

        // Busca ou cria unidade
        unidade = unidadeRepository.findAll().stream().findFirst().orElseGet(() -> {
            SecurityHolder.clear();
            Unidade u = new Unidade();
            u.setNome("Unidade Teste");
            u.setCriadoEm(LocalDateTime.now());
            u.setExcluido(false);
            u.setUnidade(null);
            return unidadeRepository.save(u);
        });

        SecurityHolder.setLoggedUserUnidadeId(unidade.getId());

        // Cria convênio
        convenio = new Convenio();
        convenio.setNome("Bradesco Saúde");
        convenio.setUnidade(unidade);
        convenio.setCriadoEm(LocalDateTime.now());
        convenio.setExcluido(false);
        convenio = convenioRepository.save(convenio);

        // Cria empresa
        empresa = new Empresa();
        empresa.setNome("Empresa ABC LTDA");
        empresa.setCnpj("99888777000166");
        empresa.setEmail("contato@empresaabc.com");
        empresa.setCriadoEm(LocalDateTime.now());
        empresa.setExcluido(false);
        empresa = empresaRepository.save(empresa);
    }

    @Test
    @Order(1)
    @DisplayName("Deve criar um paciente no banco de dados")
    @Transactional
    void testCreatePaciente() {
        // Arrange
        PacienteRequest request = new PacienteRequest(
                "Carlos Silva", // nome
                null, // nomeSocial
                null, // pressaoArterial
                "carlos@email.com", // email
                "88899900011", // cpf
                LocalDate.of(1988, 7, 15), // dataNascimento
                "M", // sexo (String)
                "47999998888", // celular
                null, // urlImagem
                null, // corIdentificacao
                "89010100", // cep
                "Rua das Flores, 123", // rua
                null, // complemento
                "Centro", // bairro
                "Blumenau", // cidade
                "SC", // uf
                null, // convenioId
                null); // empresaId

        // Act
        Paciente saved = pacienteService.createPaciente(request);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("Carlos Silva", saved.getNome());
        assertEquals("88899900011", saved.getCpf());
        assertEquals(LocalDate.of(1988, 7, 15), saved.getDataNascimento());
        assertEquals('M', saved.getSexo());
        assertEquals("carlos@email.com", saved.getEmail());
        assertFalse(saved.getExcluido());
    }

    @Test
    @Order(2)
    @DisplayName("Deve criar paciente com convênio e empresa")
    @Transactional
    void testCreatePacienteComConvenioEEmpresa() {
        // Arrange
        PacienteRequest request = new PacienteRequest(
                "Ana Paula Costa", // nome
                null, // nomeSocial
                null, // pressaoArterial
                "ana@email.com", // email
                "77766655544", // cpf
                LocalDate.of(1992, 11, 25), // dataNascimento
                "F", // sexo (String)
                "47988887777", // celular
                null, // urlImagem
                null, // corIdentificacao
                "89030200", // cep
                "Av. Brasil, 456", // rua
                null, // complemento
                "Vila Nova", // bairro
                "Blumenau", // cidade
                "SC", // uf
                convenio.getId(), // convenioId
                empresa.getId()); // empresaId

        // Act
        Paciente saved = pacienteService.createPaciente(request);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("Ana Paula Costa", saved.getNome());
        assertNotNull(saved.getConvenio());
        assertEquals(convenio.getId(), saved.getConvenio().getId());
        assertNotNull(saved.getEmpresa());
        assertEquals(empresa.getId(), saved.getEmpresa().getId());
    }

    @Test
    @Order(3)
    @DisplayName("Deve buscar paciente por ID")
    @Transactional
    void testGetById() {
        // Arrange
        Paciente paciente = new Paciente();
        paciente.setNome("João Mendes");
        paciente.setCpf("66655544433");
        paciente.setDataNascimento(LocalDate.of(1985, 4, 10));
        paciente.setSexo('M');
        paciente.setCelular("47977776666");
        paciente.setUnidade(unidade);
        paciente.setCriadoEm(LocalDateTime.now());
        paciente.setExcluido(false);
        Paciente saved = pacienteRepository.save(paciente);

        // Act
        Paciente found = pacienteService.getById(saved.getId());

        // Assert
        assertNotNull(found);
        assertEquals(saved.getId(), found.getId());
        assertEquals("João Mendes", found.getNome());
    }

    @Test
    @Order(4)
    @DisplayName("Deve lançar exceção ao buscar paciente inexistente")
    @Transactional
    void testGetByIdNotFound() {
        // Act & Assert
        assertThrows(NotFoundException.class, () -> {
            pacienteService.getById(99999L);
        });
    }

    @Test
    @Order(5)
    @DisplayName("Deve listar pacientes paginados")
    @Transactional
    void testGetPaged() {
        // Arrange - Cria 5 pacientes
        for (int i = 0; i < 5; i++) {
            Paciente paciente = new Paciente();
            paciente.setNome("Paciente " + i);
            paciente.setCpf("1234567890" + i);
            paciente.setDataNascimento(LocalDate.of(1990, 1, 1));
            paciente.setSexo('F');
            paciente.setCelular("4799999999" + i);
            paciente.setUnidade(unidade);
            paciente.setCriadoEm(LocalDateTime.now());
            paciente.setExcluido(false);
            pacienteRepository.save(paciente);
        }

        // Act
        Page<Paciente> page = pacienteService.getPaged(0, 10);

        // Assert
        assertNotNull(page);
        assertEquals(5, page.getTotalElements());
        assertEquals(1, page.getTotalPages());
        assertEquals(5, page.getContent().size());
    }

    @Test
    @Order(6)
    @DisplayName("Deve editar um paciente existente")
    @Transactional
    void testEditPaciente() {
        // Arrange - Cria paciente inicial
        Paciente paciente = new Paciente();
        paciente.setNome("Roberto Lima");
        paciente.setCpf("55544433322");
        paciente.setDataNascimento(LocalDate.of(1975, 9, 5));
        paciente.setSexo('M');
        paciente.setCelular("47966665555");
        paciente.setEmail("roberto@email.com");
        paciente.setUnidade(unidade);
        paciente.setCriadoEm(LocalDateTime.now());
        paciente.setExcluido(false);
        Paciente saved = pacienteRepository.save(paciente);

        // Request de edição
        PacienteRequest request = new PacienteRequest(
                "Roberto Lima Atualizado", // nome
                null, // nomeSocial
                null, // pressaoArterial
                "roberto.novo@email.com", // Muda email
                "55544433322", // cpf
                LocalDate.of(1975, 9, 5), // dataNascimento
                "M", // sexo (String)
                "47955554444", // Muda celular
                null, // urlImagem
                null, // corIdentificacao
                "89040300", // cep
                "Nova Rua, 789", // rua
                null, // complemento
                "Bairro Novo", // bairro
                "Blumenau", // cidade
                "SC", // uf
                null, // convenioId
                null); // empresaId

        // Act
        Paciente updated = pacienteService.editPaciente(saved.getId(), request);

        // Assert
        assertNotNull(updated);
        assertEquals(saved.getId(), updated.getId());
        assertEquals("Roberto Lima Atualizado", updated.getNome());
        assertEquals("47955554444", updated.getCelular());
        assertEquals("roberto.novo@email.com", updated.getEmail());
    }

    @Test
    @Order(7)
    @DisplayName("Deve contar total de pacientes não excluídos")
    @Transactional
    void testGetTotal() {
        // Arrange - Cria 3 pacientes ativos e 2 excluídos
        for (int i = 0; i < 3; i++) {
            Paciente paciente = new Paciente();
            paciente.setNome("Paciente Ativo " + i);
            paciente.setCpf("1111111111" + i);
            paciente.setDataNascimento(LocalDate.of(1990, 1, 1));
            paciente.setSexo('M');
            paciente.setCelular("4711111111" + i);
            paciente.setUnidade(unidade);
            paciente.setCriadoEm(LocalDateTime.now());
            paciente.setExcluido(false);
            pacienteRepository.save(paciente);
        }

        for (int i = 0; i < 2; i++) {
            Paciente paciente = new Paciente();
            paciente.setNome("Paciente Excluído " + i);
            paciente.setCpf("2222222222" + i);
            paciente.setDataNascimento(LocalDate.of(1990, 1, 1));
            paciente.setSexo('F');
            paciente.setCelular("4722222222" + i);
            paciente.setUnidade(unidade);
            paciente.setCriadoEm(LocalDateTime.now());
            paciente.setExcluido(true);
            pacienteRepository.save(paciente);
        }

        // Act
        long totalAtivos = pacienteService.getTotal(false);
        long totalExcluidos = pacienteService.getTotal(true);

        // Assert
        assertEquals(3, totalAtivos);
        assertEquals(2, totalExcluidos);
    }

    @Test
    @Order(8)
    @DisplayName("Deve listar aniversariantes do dia")
    @Transactional
    void testGetAniversariantes() {
        // Arrange - Cria paciente com aniversário hoje
        LocalDate hoje = LocalDate.now();
        Paciente pacienteAniversariante = new Paciente();
        pacienteAniversariante.setNome("Aniversariante Teste");
        pacienteAniversariante.setCpf("33333333333");
        pacienteAniversariante.setDataNascimento(hoje.minusYears(30)); // 30 anos atrás
        pacienteAniversariante.setSexo('M');
        pacienteAniversariante.setCelular("47933333333");
        pacienteAniversariante.setUnidade(unidade);
        pacienteAniversariante.setCriadoEm(LocalDateTime.now());
        pacienteAniversariante.setExcluido(false);
        pacienteRepository.save(pacienteAniversariante);

        // Cria paciente que não faz aniversário hoje
        Paciente pacienteNormal = new Paciente();
        pacienteNormal.setNome("Paciente Normal");
        pacienteNormal.setCpf("44444444444");
        pacienteNormal.setDataNascimento(hoje.minusDays(10).minusYears(25));
        pacienteNormal.setSexo('F');
        pacienteNormal.setCelular("47944444444");
        pacienteNormal.setUnidade(unidade);
        pacienteNormal.setCriadoEm(LocalDateTime.now());
        pacienteNormal.setExcluido(false);
        pacienteRepository.save(pacienteNormal);

        // Act
        List<Paciente> aniversariantes = pacienteService.getAniversariantes();

        // Assert
        assertNotNull(aniversariantes);
        assertEquals(1, aniversariantes.size());
        assertEquals("Aniversariante Teste", aniversariantes.get(0).getNome());
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }
}
