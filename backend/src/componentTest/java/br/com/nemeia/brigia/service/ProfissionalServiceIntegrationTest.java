package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
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
@DisplayName("ProfissionalService - Teste de Integração com Banco de Dados")
class ProfissionalServiceIntegrationTest {

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
    private ProfissionalService profissionalService;

    @Autowired
    private ProfissionalRepository profissionalRepository;

    @Autowired
    private UnidadeRepository unidadeRepository;

    @Autowired
    private EspecialidadeRepository especialidadeRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private Unidade unidade;
    private Especialidade especialidade1;
    private Especialidade especialidade2;
    private Usuario usuario;

    @BeforeEach
    @Transactional
    void setUp() {
        // Limpa os dados antes de cada teste
        profissionalRepository.deleteAll();
        usuarioRepository.deleteAll();
        especialidadeRepository.deleteAll();

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

        // Cria especialidades
        especialidade1 = new Especialidade();
        especialidade1.setNome("Cardiologia");
        especialidade1.setCriadoEm(LocalDateTime.now());
        especialidade1.setExcluido(false);
        especialidade1 = especialidadeRepository.save(especialidade1);

        especialidade2 = new Especialidade();
        especialidade2.setNome("Ortopedia");
        especialidade2.setCriadoEm(LocalDateTime.now());
        especialidade2.setExcluido(false);
        especialidade2 = especialidadeRepository.save(especialidade2);

        // Cria usuário
        usuario = new Usuario();
        usuario.setNome("Dr. Fernando Costa");
        usuario.setEmail("fernando@email.com");
        usuario.setSenha("senha123");
        usuario.setRoles(Collections.singletonList(RoleUsuario.MEDICO));
        usuario.setUnidade(unidade);
        usuario.setCriadoEm(LocalDateTime.now());
        usuario.setExcluido(false);
        usuario = usuarioRepository.save(usuario);
    }

    @Test
    @Order(1)
    @DisplayName("Deve criar um profissional no banco de dados")
    @Transactional
    void testCreateProfissional() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Dr. João Silva",
                "joao.silva@email.com",
                "12345678901",
                LocalDate.of(1980, 6, 15),
                "M",
                "47999887766",
                null, // urlImagem
                "1234567", // CRM
                Collections.emptyList()); // especialidades

        // Act
        Profissional saved = profissionalService.createProfissional(request);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("Dr. João Silva", saved.getNome());
        assertEquals("joao.silva@email.com", saved.getEmail());
        assertEquals("12345678901", saved.getCpf());
        assertEquals(LocalDate.of(1980, 6, 15), saved.getDataNascimento());
        assertEquals('M', saved.getSexo());
        assertEquals("1234567", saved.getCrm());
        assertFalse(saved.getExcluido());
    }

    @Test
    @Order(2)
    @DisplayName("Deve criar profissional com especialidades")
    @Transactional
    void testCreateProfissionalComEspecialidades() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Dra. Maria Santos",
                "maria.santos@email.com",
                "98765432100",
                LocalDate.of(1985, 9, 20),
                "F",
                "47988776655",
                null,
                "7654321",
                List.of(especialidade1.getId(), especialidade2.getId()));

        // Act
        Profissional saved = profissionalService.createProfissional(request);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("Dra. Maria Santos", saved.getNome());
        assertNotNull(saved.getEspecialidades());
        assertEquals(2, saved.getEspecialidades().size());
        assertTrue(saved.getEspecialidades().stream()
                .anyMatch(e -> e.getId().equals(especialidade1.getId())));
        assertTrue(saved.getEspecialidades().stream()
                .anyMatch(e -> e.getId().equals(especialidade2.getId())));
    }

    @Test
    @Order(3)
    @DisplayName("Deve buscar profissional por ID")
    @Transactional
    void testGetById() {
        // Arrange
        Profissional profissional = new Profissional();
        profissional.setNome("Dr. Pedro Oliveira");
        profissional.setCpf("11122233344");
        profissional.setDataNascimento(LocalDate.of(1975, 3, 10));
        profissional.setSexo('M');
        profissional.setCelular("47977665544");
        profissional.setEmail("pedro@email.com");
        profissional.setCrm("1122334");
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        Profissional saved = profissionalRepository.save(profissional);

        // Act
        Profissional found = profissionalService.getById(saved.getId());

        // Assert
        assertNotNull(found);
        assertEquals(saved.getId(), found.getId());
        assertEquals("Dr. Pedro Oliveira", found.getNome());
    }

    @Test
    @Order(4)
    @DisplayName("Deve lançar exceção ao buscar profissional inexistente")
    @Transactional
    void testGetByIdNotFound() {
        // Act & Assert
        assertThrows(NotFoundException.class, () -> {
            profissionalService.getById(99999L);
        });
    }

    @Test
    @Order(5)
    @DisplayName("Deve buscar profissional por usuário ID")
    @Transactional
    void testGetByUsuarioId() {
        // Arrange
        Profissional profissional = new Profissional();
        profissional.setNome("Dr. Ricardo Lima");
        profissional.setCpf("55544433322");
        profissional.setDataNascimento(LocalDate.of(1982, 7, 25));
        profissional.setSexo('M');
        profissional.setCelular("47966554433");
        profissional.setEmail("ricardo@email.com");
        profissional.setCrm("5544332");
        profissional.setUsuario(usuario);
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        profissionalRepository.save(profissional);

        // Act
        Profissional found = profissionalService.getByUsuarioId(usuario.getId());

        // Assert
        assertNotNull(found);
        assertEquals(usuario.getId(), found.getUsuario().getId());
        assertEquals("Dr. Ricardo Lima", found.getNome());
    }

    @Test
    @Order(6)
    @DisplayName("Deve listar profissionais paginados")
    @Transactional
    void testGetPaged() {
        // Arrange - Cria 5 profissionais
        for (int i = 0; i < 5; i++) {
            Profissional profissional = new Profissional();
            profissional.setNome("Profissional " + i);
            profissional.setCpf("1234567890" + i);
            profissional.setDataNascimento(LocalDate.of(1980, 1, 1));
            profissional.setSexo('M');
            profissional.setCelular("4799999999" + i);
            profissional.setEmail("prof" + i + "@email.com");
            profissional.setCrm("123456" + i);
            profissional.setUnidade(unidade);
            profissional.setCriadoEm(LocalDateTime.now());
            profissional.setExcluido(false);
            profissionalRepository.save(profissional);
        }

        // Act
        Page<Profissional> page = profissionalService.getPaged(0, 10);

        // Assert
        assertNotNull(page);
        assertEquals(5, page.getTotalElements());
        assertEquals(1, page.getTotalPages());
        assertEquals(5, page.getContent().size());
    }

    @Test
    @Order(7)
    @DisplayName("Deve editar um profissional existente")
    @Transactional
    void testEditProfissional() {
        // Arrange - Cria profissional inicial
        Profissional profissional = new Profissional();
        profissional.setNome("Dr. Alberto Mendes");
        profissional.setCpf("66655544433");
        profissional.setDataNascimento(LocalDate.of(1978, 11, 5));
        profissional.setSexo('M');
        profissional.setCelular("47955443322");
        profissional.setEmail("alberto@email.com");
        profissional.setCrm("6655443");
        profissional.setUsuario(usuario);
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        Profissional saved = profissionalRepository.save(profissional);

        // Request de edição
        ProfissionalRequest request = new ProfissionalRequest(
                "Dr. Alberto Mendes Atualizado",
                "alberto.novo@email.com", // Muda email
                "66655544433",
                LocalDate.of(1978, 11, 5),
                "M",
                "47944332211", // Muda celular
                null,
                "6655443",
                List.of(especialidade1.getId())); // Adiciona especialidade

        // Act
        Profissional updated = profissionalService.editProfissional(saved.getId(), request);

        // Assert
        assertNotNull(updated);
        assertEquals(saved.getId(), updated.getId());
        assertEquals("Dr. Alberto Mendes Atualizado", updated.getNome());
        assertEquals("alberto.novo@email.com", updated.getEmail());
        assertEquals("47944332211", updated.getCelular());
        assertNotNull(updated.getEspecialidades());
        assertEquals(1, updated.getEspecialidades().size());
        // Verifica que usuário e unidade não foram alterados
        assertEquals(usuario.getId(), updated.getUsuario().getId());
        assertEquals(unidade.getId(), updated.getUnidade().getId());
    }

    @Test
    @Order(8)
    @DisplayName("Deve listar aniversariantes do dia")
    @Transactional
    void testGetAniversariantes() {
        // Arrange - Cria profissional com aniversário hoje
        LocalDate hoje = LocalDate.now();
        Profissional profissionalAniversariante = new Profissional();
        profissionalAniversariante.setNome("Dr. Aniversariante");
        profissionalAniversariante.setCpf("77766655544");
        profissionalAniversariante.setDataNascimento(hoje); // Data exata de hoje
        profissionalAniversariante.setSexo('M');
        profissionalAniversariante.setCelular("47933221100");
        profissionalAniversariante.setEmail("aniversariante@email.com");
        profissionalAniversariante.setCrm("7766554");
        profissionalAniversariante.setUnidade(unidade);
        profissionalAniversariante.setCriadoEm(LocalDateTime.now());
        profissionalAniversariante.setExcluido(false);
        profissionalRepository.save(profissionalAniversariante);

        // Cria profissional que não faz aniversário hoje
        Profissional profissionalNormal = new Profissional();
        profissionalNormal.setNome("Dr. Normal");
        profissionalNormal.setCpf("88877766655");
        profissionalNormal.setDataNascimento(hoje.minusDays(10));
        profissionalNormal.setSexo('F');
        profissionalNormal.setCelular("47922110099");
        profissionalNormal.setEmail("normal@email.com");
        profissionalNormal.setCrm("8877665");
        profissionalNormal.setUnidade(unidade);
        profissionalNormal.setCriadoEm(LocalDateTime.now());
        profissionalNormal.setExcluido(false);
        profissionalRepository.save(profissionalNormal);

        // Act
        List<Profissional> aniversariantes = profissionalService.getAniversariantes();

        // Assert
        assertNotNull(aniversariantes);
        assertEquals(1, aniversariantes.size());
        assertEquals("Dr. Aniversariante", aniversariantes.get(0).getNome());
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }
}
