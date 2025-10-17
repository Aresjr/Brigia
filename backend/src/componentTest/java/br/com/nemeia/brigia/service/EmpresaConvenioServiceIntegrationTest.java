package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ConvenioRequest;
import br.com.nemeia.brigia.dto.request.EmpresaRequest;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
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
@DisplayName("Empresa e Convênio Services - Testes de Integração")
class EmpresaConvenioServiceIntegrationTest {

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
    private EmpresaService empresaService;

    @Autowired
    private ConvenioService convenioService;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private ConvenioRepository convenioRepository;

    @Autowired
    private UnidadeRepository unidadeRepository;

    @Autowired
    private EmpresaPlanoRepository empresaPlanoRepository;

    private Unidade unidade;
    private EmpresaPlano empresaPlano;

    @BeforeEach
    @Transactional
    void setUp() {
        empresaRepository.deleteAll();
        convenioRepository.deleteAll();
        empresaPlanoRepository.deleteAll();

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

        // Cria plano empresarial
        empresaPlano = new EmpresaPlano();
        empresaPlano.setNome("Plano Bronze");
        empresaPlano.setDescricao("Plano básico");
        empresaPlano.setCorFundo("#CD7F32");
        empresaPlano = empresaPlanoRepository.save(empresaPlano);
    }

    @Test
    @Order(1)
    @DisplayName("Deve criar uma empresa")
    @Transactional
    void testCreateEmpresa() {
        EmpresaRequest request = new EmpresaRequest(
                "Empresa ABC LTDA", // nome
                "Observações da empresa", // observacao
                "ABC123", // codigoBc
                "12345678000100", // cnpj
                "contato@empresaabc.com", // email
                new BigDecimal("1000.00"), // valorMinimoMensal
                new BigDecimal("50.00"), // minimoPorFuncionario
                new BigDecimal("500.00"), // valorMes
                null, // planoId
                10L); // func

        Empresa saved = empresaService.createEmpresa(request);

        assertNotNull(saved.getId());
        assertEquals("Empresa ABC LTDA", saved.getNome());
        assertEquals("12345678000100", saved.getCnpj());
    }

    @Test
    @Order(2)
    @DisplayName("Deve criar empresa com plano")
    @Transactional
    void testCreateEmpresaComPlano() {
        EmpresaRequest request = new EmpresaRequest(
                "Empresa XYZ LTDA", // nome
                null, // observacao
                null, // codigoBc
                "98765432000111", // cnpj
                "contato@empresaxyz.com", // email
                null, // valorMinimoMensal
                null, // minimoPorFuncionario
                null, // valorMes
                empresaPlano.getId(), // planoId
                null); // func

        Empresa saved = empresaService.createEmpresa(request);

        assertNotNull(saved.getId());
        assertNotNull(saved.getPlano());
        assertEquals(empresaPlano.getId(), saved.getPlano().getId());
    }

    @Test
    @Order(3)
    @DisplayName("Deve listar empresas paginadas")
    @Transactional
    void testGetEmpresasPaged() {
        for (int i = 0; i < 3; i++) {
            Empresa empresa = new Empresa();
            empresa.setNome("Empresa " + i);
            empresa.setCnpj("1234567800010" + i);
            empresa.setEmail("empresa" + i + "@email.com");
            empresa.setCriadoEm(LocalDateTime.now());
            empresa.setExcluido(false);
            empresaRepository.save(empresa);
        }

        Page<Empresa> page = empresaService.getPaged(0, 10, false);

        assertNotNull(page);
        assertEquals(3, page.getTotalElements());
    }

    @Test
    @Order(4)
    @DisplayName("Deve criar um convênio")
    @Transactional
    void testCreateConvenio() {
        ConvenioRequest request = new ConvenioRequest("Unimed", "Plano completo");

        Convenio saved = convenioService.createConvenio(request);

        assertNotNull(saved.getId());
        assertEquals("Unimed", saved.getNome());
        assertEquals(unidade.getId(), saved.getUnidade().getId());
    }

    @Test
    @Order(5)
    @DisplayName("Deve editar um convênio")
    @Transactional
    void testEditConvenio() {
        Convenio convenio = new Convenio();
        convenio.setNome("Bradesco Saúde");
        convenio.setUnidade(unidade);
        convenio.setCriadoEm(LocalDateTime.now());
        convenio.setExcluido(false);
        Convenio saved = convenioRepository.save(convenio);

        ConvenioRequest request = new ConvenioRequest("Bradesco Saúde Plus", "Descrição atualizada");
        Convenio updated = convenioService.editConvenio(saved.getId(), request);

        assertEquals("Bradesco Saúde Plus", updated.getNome());
        assertEquals(saved.getId(), updated.getId());
    }

    @Test
    @Order(6)
    @DisplayName("Deve listar convênios paginados")
    @Transactional
    void testGetConveniosPaged() {
        for (int i = 0; i < 4; i++) {
            Convenio convenio = new Convenio();
            convenio.setNome("Convênio " + i);
            convenio.setUnidade(unidade);
            convenio.setCriadoEm(LocalDateTime.now());
            convenio.setExcluido(false);
            convenioRepository.save(convenio);
        }

        Page<Convenio> page = convenioService.getPaged(0, 10, false);

        assertNotNull(page);
        assertEquals(4, page.getTotalElements());
    }

    @Test
    @Order(7)
    @DisplayName("Deve excluir e restaurar empresa")
    @Transactional
    void testDeleteAndRestoreEmpresa() {
        Empresa empresa = new Empresa();
        empresa.setNome("Empresa Para Excluir");
        empresa.setCnpj("11111111000111");
        empresa.setEmail("excluir@email.com");
        empresa.setCriadoEm(LocalDateTime.now());
        empresa.setExcluido(false);
        Empresa saved = empresaRepository.save(empresa);

        empresaService.deleteEmpresa(saved.getId());
        Empresa deleted = empresaService.getById(saved.getId());
        assertTrue(deleted.getExcluido());

        empresaService.restoreEmpresa(saved.getId());
        Empresa restored = empresaService.getById(saved.getId());
        assertFalse(restored.getExcluido());
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }
}
