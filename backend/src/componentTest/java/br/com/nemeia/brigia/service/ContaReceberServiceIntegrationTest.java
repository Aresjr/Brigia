package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
@DisplayName("ContaReceberService - Teste de Integração com Banco de Dados")
class ContaReceberServiceIntegrationTest {

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
    private ContaReceberService contaReceberService;

    @Autowired
    private ContaReceberRepository contaReceberRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    @Autowired
    private ProfissionalRepository profissionalRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private AgendamentoRepository agendamentoRepository;

    @Autowired
    private UnidadeRepository unidadeRepository;

    @Autowired
    private ConvenioRepository convenioRepository;

    @Autowired
    private EspecialidadeRepository especialidadeRepository;

    private Unidade unidade;
    private Paciente paciente;
    private Profissional profissional;
    private Empresa empresa;
    private Convenio convenio;
    private Especialidade especialidade;
    private Atendimento atendimento;
    private Agendamento agendamento;

    @BeforeEach
    @Transactional
    void setUp() {
        // Limpa os dados antes de cada teste
        contaReceberRepository.deleteAll();
        atendimentoRepository.deleteAll();
        pacienteRepository.deleteAll();
        profissionalRepository.deleteAll();
        empresaRepository.deleteAll();
        convenioRepository.deleteAll();
        especialidadeRepository.deleteAll();
        // Não limpar unidadeRepository pois pode ter dados de migrations

        // Busca ou cria unidade - Primeiro sem configurar o SecurityHolder para evitar referência cíclica
        unidade = unidadeRepository.findAll().stream().findFirst().orElseGet(() -> {
            // Temporariamente limpa o SecurityHolder para criar a unidade sem referência cíclica
            SecurityHolder.clear();
            Unidade u = new Unidade();
            u.setNome("Unidade Teste");
            u.setCriadoEm(LocalDateTime.now());
            u.setExcluido(false);
            u.setUnidade(null); // Garante que não há referência cíclica
            return unidadeRepository.save(u);
        });

        // Configura o SecurityHolder com o ID real da unidade para os testes
        SecurityHolder.setLoggedUserUnidadeId(unidade.getId());

        // Cria especialidade
        especialidade = new Especialidade();
        especialidade.setNome("Clínica Geral");
        especialidade.setCriadoEm(LocalDateTime.now());
        especialidade.setExcluido(false);
        especialidade = especialidadeRepository.save(especialidade);

        // Cria paciente
        paciente = new Paciente();
        paciente.setNome("João da Silva");
        paciente.setCpf("12345678901");
        paciente.setDataNascimento(LocalDate.of(1990, 1, 1));
        paciente.setSexo('M');
        paciente.setCelular("47999999999");
        paciente.setUnidade(unidade);
        paciente.setCriadoEm(LocalDateTime.now());
        paciente.setExcluido(false);
        paciente = pacienteRepository.save(paciente);

        // Cria profissional
        profissional = new Profissional();
        profissional.setNome("Dr. Carlos Santos");
        profissional.setCpf("98765432100");
        profissional.setDataNascimento(LocalDate.of(1980, 5, 15));
        profissional.setSexo('M');
        profissional.setCelular("47988888888");
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        profissional = profissionalRepository.save(profissional);

        // Cria empresa
        empresa = new Empresa();
        empresa.setNome("Empresa Teste LTDA");
        empresa.setCnpj("12345678000190");
        empresa.setEmail("contato@empresateste.com.br");
        empresa.setCriadoEm(LocalDateTime.now());
        empresa.setExcluido(false);
        empresa = empresaRepository.save(empresa);

        // Cria convênio
        convenio = new Convenio();
        convenio.setNome("Unimed");
        convenio.setUnidade(unidade);
        convenio.setCriadoEm(LocalDateTime.now());
        convenio.setExcluido(false);
        convenio = convenioRepository.save(convenio);

        // Cria atendimento
        atendimento = new Atendimento();
        atendimento.setPaciente(paciente);
        atendimento.setProfissional(profissional);
        atendimento.setEmpresa(empresa);
        atendimento.setConvenio(convenio);
        atendimento.setEspecialidade(especialidade);
        atendimento.setData(LocalDate.now());
        atendimento.setHoraInicio(LocalTime.of(10, 0));
        atendimento.setHoraFim(LocalTime.of(11, 0));
        atendimento.setValorAgendamento(new BigDecimal("150.00"));
        atendimento.setValorDescontoAgendamento(new BigDecimal("15.00"));
        atendimento.setValorLancado(new BigDecimal("50.00"));
        atendimento.setFormaPagamento(FormaPagamento.DINHEIRO);
        atendimento.setStatus(StatusAtendimento.FINALIZADO);
        atendimento.setUnidade(unidade);
        atendimento.setCriadoEm(LocalDateTime.now());
        atendimento.setExcluido(false);
        atendimento = atendimentoRepository.save(atendimento);

        // Cria agendamento para os testes
        agendamento = new Agendamento();
        agendamento.setPaciente(paciente);
        agendamento.setProfissional(profissional);
        agendamento.setEmpresa(empresa);
        agendamento.setConvenio(convenio);
        agendamento.setData(LocalDate.now());
        agendamento.setHora(LocalTime.of(10, 0));
        agendamento.setDuracao(60);
        agendamento.setValor(new BigDecimal("150.00"));
        agendamento.setDesconto(new BigDecimal("15.00"));
        agendamento.setFormaPagamento(FormaPagamento.DINHEIRO);
        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setTipoAgendamento(TipoAgendamento.CONSULTA);
        agendamento.setEncaixe(false);
        agendamento.setPago(false);
        agendamento.setUnidade(unidade);
        agendamento.setCriadoEm(LocalDateTime.now());
        agendamento.setExcluido(false);
        agendamento = agendamentoRepository.save(agendamento);
    }

    @Test
    @Order(1)
    @DisplayName("Deve salvar uma conta a receber no banco de dados")
    @Transactional
    void testSaveContaReceber() {
        // Arrange
        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setPaciente(paciente);
        contaReceber.setEmpresa(empresa);
        contaReceber.setAgendamento(agendamento);
        contaReceber.setProfissional(profissional);
        contaReceber.setConvenio(convenio);
        contaReceber.setDataAgendamento(LocalDate.now());
        contaReceber.setValorAgendamento(new BigDecimal("150.00"));
        contaReceber.setValorDesconto(new BigDecimal("15.00"));
        contaReceber.setValorTotalLancado(new BigDecimal("50.00"));
        contaReceber.setValorRecebido(BigDecimal.ZERO);
        contaReceber.setFormaPagamento(FormaPagamento.DINHEIRO);
        contaReceber.setStatus(StatusContaReceber.ABERTO);
        contaReceber.setUnidade(unidade);
        contaReceber.setCriadoEm(LocalDateTime.now());
        contaReceber.setExcluido(false);

        // Act
        ContaReceber saved = contaReceberRepository.save(contaReceber);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("João da Silva", saved.getPaciente().getNome());
        assertEquals("Dr. Carlos Santos", saved.getProfissional().getNome());
        assertEquals(new BigDecimal("150.00"), saved.getValorAgendamento());
        assertEquals(new BigDecimal("185.00"), saved.getValorTotal()); // 150 + 50 - 15
        assertEquals(StatusContaReceber.ABERTO, saved.getStatus());
        assertFalse(saved.isFaturado());
    }

    @Test
    @Order(2)
    @DisplayName("Deve listar contas a receber paginadas do banco de dados")
    @Transactional
    void testListContasReceberPaged() {
        // Arrange - Cria 3 contas a receber
        for (int i = 0; i < 3; i++) {
            ContaReceber contaReceber = new ContaReceber();
            contaReceber.setPaciente(paciente);
            contaReceber.setEmpresa(empresa);
            contaReceber.setAgendamento(agendamento);
            contaReceber.setProfissional(profissional);
            contaReceber.setConvenio(convenio);
            contaReceber.setDataAgendamento(LocalDate.now());
            contaReceber.setValorAgendamento(new BigDecimal("100.00").add(new BigDecimal(i * 10)));
            contaReceber.setValorDesconto(new BigDecimal("10.00"));
            contaReceber.setValorTotalLancado(new BigDecimal("20.00"));
            contaReceber.setValorRecebido(BigDecimal.ZERO);
            contaReceber.setFormaPagamento(FormaPagamento.values()[i % FormaPagamento.values().length]);
            contaReceber.setStatus(StatusContaReceber.ABERTO);
            contaReceber.setUnidade(unidade);
            contaReceber.setCriadoEm(LocalDateTime.now());
            contaReceber.setExcluido(false);
            contaReceberRepository.save(contaReceber);
        }

        // Act
        Page<ContaReceber> page = contaReceberService.getPaged(0, 10);

        // Assert
        assertNotNull(page);
        assertEquals(3, page.getTotalElements());
        assertEquals(1, page.getTotalPages());
        assertEquals(3, page.getContent().size());

        // Verifica que não há exceção de stream ao acessar os dados
        page.getContent().forEach(conta -> {
            assertNotNull(conta.getId());
            assertNotNull(conta.getPaciente());
            assertNotNull(conta.getProfissional());
            assertNotNull(conta.getValorAgendamento());
        });
    }

    @Test
    @Order(3)
    @DisplayName("Deve criar conta a receber a partir de agendamento")
    @Transactional
    void testCreateContaReceberFromAgendamento() {
        // Arrange
        Agendamento agendamentoNovo = new Agendamento();
        agendamentoNovo.setPaciente(paciente);
        agendamentoNovo.setProfissional(profissional);
        agendamentoNovo.setEmpresa(empresa);
        agendamentoNovo.setConvenio(convenio);
        agendamentoNovo.setData(LocalDate.now());
        agendamentoNovo.setHora(LocalTime.of(14, 0));
        agendamentoNovo.setDuracao(60);
        agendamentoNovo.setValor(new BigDecimal("200.00"));
        agendamentoNovo.setDesconto(new BigDecimal("20.00"));
        agendamentoNovo.setFormaPagamento(FormaPagamento.PIX);
        agendamentoNovo.setStatus(StatusAgendamento.AGENDADO);
        agendamentoNovo.setTipoAgendamento(TipoAgendamento.CONSULTA);
        agendamentoNovo.setEncaixe(false);
        agendamentoNovo.setPago(false);
        agendamentoNovo.setUnidade(unidade);
        agendamentoNovo.setCriadoEm(LocalDateTime.now());
        agendamentoNovo.setExcluido(false);
        agendamentoNovo = agendamentoRepository.save(agendamentoNovo);

        // Act
        contaReceberService.createContaReceberFromAgendamento(agendamentoNovo);

        // Assert
        Page<ContaReceber> page = contaReceberService.getPaged(0, 10);
        assertEquals(1, page.getTotalElements());

        ContaReceber created = page.getContent().get(0);
        assertEquals(new BigDecimal("200.00"), created.getValorAgendamento());
        assertEquals(new BigDecimal("20.00"), created.getValorDesconto());
        assertEquals(BigDecimal.ZERO, created.getValorTotalLancado());
        assertEquals(FormaPagamento.PIX, created.getFormaPagamento());
        assertEquals(StatusContaReceber.ABERTO, created.getStatus());
        assertEquals(BigDecimal.ZERO, created.getValorRecebido());
        // Verifica os novos campos
        assertEquals(convenio.getId(), created.getConvenio().getId());
        assertEquals(LocalDate.now(), created.getDataAgendamento());
    }

    @Test
    @Order(4)
    @DisplayName("Deve registrar recebimento parcial de conta a receber")
    @Transactional
    void testRegistrarRecebimentoParcial() {
        // Arrange
        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setPaciente(paciente);
        contaReceber.setEmpresa(empresa);
        contaReceber.setAgendamento(agendamento);
        contaReceber.setProfissional(profissional);
        contaReceber.setConvenio(convenio);
        contaReceber.setDataAgendamento(LocalDate.now());
        contaReceber.setValorAgendamento(new BigDecimal("300.00"));
        contaReceber.setValorDesconto(new BigDecimal("30.00"));
        contaReceber.setValorTotalLancado(new BigDecimal("60.00"));
        contaReceber.setValorRecebido(BigDecimal.ZERO);
        contaReceber.setFormaPagamento(FormaPagamento.CARTAO_CREDITO);
        contaReceber.setStatus(StatusContaReceber.ABERTO);
        contaReceber.setUnidade(unidade);
        contaReceber.setCriadoEm(LocalDateTime.now());
        contaReceber.setExcluido(false);
        ContaReceber saved = contaReceberRepository.save(contaReceber);

        // Act
        BigDecimal valorRecebido = new BigDecimal("150.00");
        ContaReceber updated = contaReceberService.registrarRecebimento(saved.getId(), valorRecebido);

        // Assert
        assertNotNull(updated);
        assertEquals(valorRecebido, updated.getValorRecebido());
        assertEquals(StatusContaReceber.PARCIAL, updated.getStatus());
        assertFalse(updated.isFaturado());
    }

    @Test
    @Order(5)
    @DisplayName("Deve registrar recebimento total de conta a receber")
    @Transactional
    void testRegistrarRecebimentoTotal() {
        // Arrange
        ContaReceber contaReceber = new ContaReceber();
        contaReceber.setPaciente(paciente);
        contaReceber.setEmpresa(empresa);
        contaReceber.setAgendamento(agendamento);
        contaReceber.setProfissional(profissional);
        contaReceber.setConvenio(convenio);
        contaReceber.setDataAgendamento(LocalDate.now());
        contaReceber.setValorAgendamento(new BigDecimal("200.00"));
        contaReceber.setValorDesconto(new BigDecimal("20.00"));
        contaReceber.setValorTotalLancado(new BigDecimal("30.00"));
        contaReceber.setValorRecebido(BigDecimal.ZERO);
        contaReceber.setFormaPagamento(FormaPagamento.PIX);
        contaReceber.setStatus(StatusContaReceber.ABERTO);
        contaReceber.setUnidade(unidade);
        contaReceber.setCriadoEm(LocalDateTime.now());
        contaReceber.setExcluido(false);
        ContaReceber saved = contaReceberRepository.save(contaReceber);

        // Valor total = 200 + 30 - 20 = 210
        BigDecimal valorTotal = saved.getValorTotal();

        // Act
        ContaReceber updated = contaReceberService.registrarRecebimento(saved.getId(), valorTotal);

        // Assert
        assertNotNull(updated);
        assertEquals(valorTotal, updated.getValorRecebido());
        assertEquals(StatusContaReceber.PAGO, updated.getStatus());
        assertTrue(updated.isFaturado());
    }

    @Test
    @Order(6)
    @DisplayName("Deve listar múltiplas páginas sem erro de stream")
    @Transactional
    void testListMultiplePagesWithoutStreamError() {
        // Arrange - Cria 25 contas a receber
        for (int i = 0; i < 25; i++) {
            ContaReceber contaReceber = new ContaReceber();
            contaReceber.setPaciente(paciente);
            contaReceber.setEmpresa(empresa);
            contaReceber.setAgendamento(agendamento);
            contaReceber.setProfissional(profissional);
            contaReceber.setConvenio(convenio);
            contaReceber.setDataAgendamento(LocalDate.now());
            contaReceber.setValorAgendamento(new BigDecimal("100.00"));
            contaReceber.setValorDesconto(new BigDecimal("10.00"));
            contaReceber.setValorTotalLancado(new BigDecimal("0.00"));
            contaReceber.setValorRecebido(BigDecimal.ZERO);
            contaReceber.setFormaPagamento(FormaPagamento.DINHEIRO);
            contaReceber.setStatus(StatusContaReceber.ABERTO);
            contaReceber.setUnidade(unidade);
            contaReceber.setCriadoEm(LocalDateTime.now());
            contaReceber.setExcluido(false);
            contaReceberRepository.save(contaReceber);
        }

        // Act & Assert - não deve lançar exceção de stream
        assertDoesNotThrow(() -> {
            Page<ContaReceber> page1 = contaReceberService.getPaged(0, 10);
            Page<ContaReceber> page2 = contaReceberService.getPaged(1, 10);
            Page<ContaReceber> page3 = contaReceberService.getPaged(2, 10);

            assertEquals(10, page1.getContent().size());
            assertEquals(10, page2.getContent().size());
            assertEquals(5, page3.getContent().size());
            assertEquals(25, page1.getTotalElements());
        });
    }

    @AfterEach
    void tearDown() {
        // Limpa o SecurityHolder após cada teste
        SecurityHolder.clear();
    }
}
