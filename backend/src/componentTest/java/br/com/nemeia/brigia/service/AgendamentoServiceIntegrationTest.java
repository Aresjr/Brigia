package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AgendamentoRequest;
import br.com.nemeia.brigia.dto.request.ProcedimentoAgendamentoRequest;
import br.com.nemeia.brigia.exception.DisponibilidadeNaoEncontradaException;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
@DisplayName("AgendamentoService - Teste de Integração com Banco de Dados")
class AgendamentoServiceIntegrationTest {

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
        registry.add("app.base-url", () -> "http://localhost:4200");
    }

    @Autowired
    private AgendamentoService agendamentoService;

    @Autowired
    private AgendamentoRepository agendamentoRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    @Autowired
    private ProfissionalRepository profissionalRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private UnidadeRepository unidadeRepository;

    @Autowired
    private ConvenioRepository convenioRepository;

    @Autowired
    private EspecialidadeRepository especialidadeRepository;

    @Autowired
    private DisponibilidadeRepository disponibilidadeRepository;

    @Autowired
    private ProcedimentoRepository procedimentoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private Unidade unidade;
    private Paciente paciente;
    private Profissional profissional;
    private Empresa empresa;
    private Convenio convenio;
    private Especialidade especialidade;
    private Disponibilidade disponibilidade;
    private Procedimento procedimento;
    private Usuario usuario;

    @BeforeEach
    @Transactional
    void setUp() {
        // Limpa os dados antes de cada teste
        agendamentoRepository.deleteAll();
        disponibilidadeRepository.deleteAll();
        procedimentoRepository.deleteAll();
        pacienteRepository.deleteAll();
        profissionalRepository.deleteAll();
        usuarioRepository.deleteAll();
        empresaRepository.deleteAll();
        convenioRepository.deleteAll();
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

        // Cria especialidade
        especialidade = new Especialidade();
        especialidade.setNome("Psicologia");
        especialidade.setCriadoEm(LocalDateTime.now());
        especialidade.setExcluido(false);
        especialidade = especialidadeRepository.save(especialidade);

        // Cria paciente
        paciente = new Paciente();
        paciente.setNome("Maria Santos");
        paciente.setCpf("11122233344");
        paciente.setDataNascimento(LocalDate.of(1995, 3, 10));
        paciente.setSexo('F');
        paciente.setCelular("47988887777");
        paciente.setEmail("maria@email.com");
        paciente.setUnidade(unidade);
        paciente.setCriadoEm(LocalDateTime.now());
        paciente.setExcluido(false);
        paciente = pacienteRepository.save(paciente);

        // Cria usuário
        usuario = new Usuario();
        usuario.setNome("Dr. Pedro Silva");
        usuario.setEmail("pedro@email.com");
        usuario.setSenha("senha123");
        usuario.setRoles(Collections.singletonList(RoleUsuario.MEDICO));
        usuario.setUnidade(unidade);
        usuario.setCriadoEm(LocalDateTime.now());
        usuario.setExcluido(false);
        usuario = usuarioRepository.save(usuario);

        // Cria profissional
        profissional = new Profissional();
        profissional.setNome("Dr. Pedro Silva");
        profissional.setCpf("55566677788");
        profissional.setDataNascimento(LocalDate.of(1985, 8, 20));
        profissional.setSexo('M');
        profissional.setCelular("47977776666");
        profissional.setUsuario(usuario);
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        profissional = profissionalRepository.save(profissional);

        // Cria empresa
        empresa = new Empresa();
        empresa.setNome("Tech Solutions LTDA");
        empresa.setCnpj("11222333000144");
        empresa.setEmail("contato@techsolutions.com");
        empresa.setCriadoEm(LocalDateTime.now());
        empresa.setExcluido(false);
        empresa = empresaRepository.save(empresa);

        // Cria convênio
        convenio = new Convenio();
        convenio.setNome("Amil");
        convenio.setUnidade(unidade);
        convenio.setCriadoEm(LocalDateTime.now());
        convenio.setExcluido(false);
        convenio = convenioRepository.save(convenio);

        // Cria procedimento
        procedimento = new Procedimento();
        procedimento.setNome("Consulta Psicológica");
        procedimento.setValorPadrao(new BigDecimal("180.00"));
        procedimento.setValorRepasse(new BigDecimal("90.00"));
        procedimento.setUnidade(unidade);
        procedimento.setCriadoEm(LocalDateTime.now());
        procedimento.setExcluido(false);
        procedimento = procedimentoRepository.save(procedimento);

        // Cria disponibilidade para o profissional (necessária para validação)
        LocalDate proximaSegunda = LocalDate.now().with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(LocalDate.now())) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        disponibilidade = new Disponibilidade();
        disponibilidade.setProfissional(profissional);
        disponibilidade.setDia(proximaSegunda);
        disponibilidade.setHoraInicial(LocalTime.of(8, 0));
        disponibilidade.setHoraFinal(LocalTime.of(18, 0));
        disponibilidade.setUnidade(unidade);
        disponibilidade.setCriadoEm(LocalDateTime.now());
        disponibilidade.setExcluido(false);
        disponibilidade = disponibilidadeRepository.save(disponibilidade);
    }

    @Test
    @Order(1)
    @DisplayName("Deve criar um agendamento no banco de dados")
    @Transactional
    void testCreateAgendamento() {
        // Arrange
        LocalDate proximaSegunda = LocalDate.now().with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(LocalDate.now()) || proximaSegunda.isEqual(LocalDate.now())) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        AgendamentoRequest request = new AgendamentoRequest(
                paciente.getId(),
                proximaSegunda,
                LocalTime.of(10, 0),
                especialidade.getId(),
                profissional.getId(),
                TipoAgendamento.CONSULTA, // tipoAgendamento
                procedimento.getId(),
                empresa.getId(),
                convenio.getId(),
                FormaPagamento.PIX,
                new BigDecimal("180.00"),
                new BigDecimal("0.00"),
                60,
                "Primeira consulta",
                false,
                false,
                false,
                null,
                null);

        // Act
        Agendamento saved = agendamentoService.createAgendamento(request);

        // Assert
        assertNotNull(saved.getId());
        assertEquals("Maria Santos", saved.getPaciente().getNome());
        assertEquals("Dr. Pedro Silva", saved.getProfissional().getNome());
        assertEquals(StatusAgendamento.AGENDADO, saved.getStatus());
        assertEquals(proximaSegunda, saved.getData());
        assertEquals(LocalTime.of(10, 0), saved.getHora());
        assertFalse(saved.getEncaixe());
    }

    @Test
    @Order(2)
    @DisplayName("Deve criar agendamento com encaixe fora da disponibilidade, mas validando conflito de horário")
    @Transactional
    void testCreateAgendamentoComEncaixe() {
        // Arrange - horário fora da disponibilidade cadastrada (20h, disponibilidade vai até 18h)
        // mas SEM conflito com outro agendamento
        AgendamentoRequest request = new AgendamentoRequest(
                paciente.getId(),
                LocalDate.now().plusDays(1),
                LocalTime.of(20, 0), // Fora do horário de disponibilidade
                especialidade.getId(),
                profissional.getId(),
                TipoAgendamento.CONSULTA, // tipoAgendamento
                procedimento.getId(),
                null, // empresaId
                null, // convenioId
                FormaPagamento.DINHEIRO,
                new BigDecimal("180.00"),
                new BigDecimal("0.00"),
                60,
                "Encaixe emergencial",
                false, // precoAlterado
                true, // encaixe = true
                false, // pago
                null, // quantiaPaga
                null); // procedimentos

        // Act & Assert - não deve lançar exceção (encaixe permite fora da disponibilidade)
        assertDoesNotThrow(() -> {
            Agendamento saved = agendamentoService.createAgendamento(request);
            assertNotNull(saved.getId());
            assertTrue(saved.getEncaixe());
            assertEquals(StatusAgendamento.AGENDADO, saved.getStatus());
        });
    }

    @Test
    @Order(3)
    @DisplayName("Deve impedir encaixe no mesmo horário de outro agendamento")
    @Transactional
    void testEncaixeNaoPermiteConflitoDeHorario() {
        // Arrange - Cria um agendamento primeiro
        LocalDate proximaSegunda = LocalDate.now().with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(LocalDate.now()) || proximaSegunda.isEqual(LocalDate.now())) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        Agendamento agendamentoExistente = new Agendamento();
        agendamentoExistente.setPaciente(paciente);
        agendamentoExistente.setProfissional(profissional);
        agendamentoExistente.setEspecialidade(especialidade);
        agendamentoExistente.setData(proximaSegunda);
        agendamentoExistente.setHora(LocalTime.of(10, 0));
        agendamentoExistente.setDuracao(60);
        agendamentoExistente.setValor(new BigDecimal("180.00"));
        agendamentoExistente.setDesconto(BigDecimal.ZERO);
        agendamentoExistente.setFormaPagamento(FormaPagamento.PIX);
        agendamentoExistente.setStatus(StatusAgendamento.AGENDADO);
        agendamentoExistente.setTipoAgendamento(TipoAgendamento.CONSULTA);
        agendamentoExistente.setEncaixe(false);
        agendamentoExistente.setPago(false);
        agendamentoExistente.setUnidade(unidade);
        agendamentoExistente.setCriadoEm(LocalDateTime.now());
        agendamentoExistente.setExcluido(false);
        agendamentoRepository.save(agendamentoExistente);

        // Tenta criar um encaixe no MESMO horário
        AgendamentoRequest request = new AgendamentoRequest(
                paciente.getId(),
                proximaSegunda,
                LocalTime.of(10, 0), // MESMO horário do agendamento existente
                especialidade.getId(),
                profissional.getId(),
                TipoAgendamento.CONSULTA,
                procedimento.getId(),
                null,
                null,
                FormaPagamento.DINHEIRO,
                new BigDecimal("180.00"),
                new BigDecimal("0.00"),
                60,
                "Tentativa de encaixe no mesmo horário",
                false,
                true, // encaixe = true
                false,
                null,
                null);

        // Act & Assert - deve lançar exceção mesmo sendo encaixe
        assertThrows(DisponibilidadeNaoEncontradaException.class, () -> {
            agendamentoService.createAgendamento(request);
        });
    }

    @Test
    @Order(4)
    @DisplayName("Deve criar agendamento com procedimentos")
    @Transactional
    void testCreateAgendamentoComProcedimentos() {
        // Arrange
        LocalDate proximaSegunda = LocalDate.now().with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(LocalDate.now()) || proximaSegunda.isEqual(LocalDate.now())) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        ProcedimentoAgendamentoRequest procReq = new ProcedimentoAgendamentoRequest(procedimento.getId(), 2);

        AgendamentoRequest request = new AgendamentoRequest(
                paciente.getId(),
                proximaSegunda,
                LocalTime.of(14, 0),
                especialidade.getId(),
                profissional.getId(),
                TipoAgendamento.PROCEDIMENTO, // tipoAgendamento
                null, // procedimentoId
                null, // empresaId
                null, // convenioId
                FormaPagamento.CARTAO_CREDITO,
                new BigDecimal("0.00"),
                new BigDecimal("0.00"),
                60,
                null, // observacoes
                false, // precoAlterado
                false, // encaixe
                false, // pago
                null, // quantiaPaga
                List.of(procReq));

        // Act
        Agendamento saved = agendamentoService.createAgendamento(request);

        // Assert
        assertNotNull(saved.getId());
        assertNotNull(saved.getProcedimentos());
        assertEquals(1, saved.getProcedimentos().size());
        assertEquals(2, saved.getProcedimentos().get(0).getQuantidade());
        assertEquals(procedimento.getId(), saved.getProcedimentos().get(0).getProcedimento().getId());
    }

    @Test
    @Order(5)
    @DisplayName("Deve listar agendamentos paginados por data")
    @Transactional
    void testGetByDate() {
        // Arrange - Cria 3 agendamentos no mesmo mês
        LocalDate hoje = LocalDate.now();
        LocalDate proximaSegunda = hoje.with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(hoje) || proximaSegunda.isEqual(hoje)) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        for (int i = 0; i < 3; i++) {
            Agendamento agendamento = new Agendamento();
            agendamento.setPaciente(paciente);
            agendamento.setProfissional(profissional);
            agendamento.setEspecialidade(especialidade);
            agendamento.setData(proximaSegunda.plusDays(i * 7));
            agendamento.setHora(LocalTime.of(10 + i, 0));
            agendamento.setDuracao(60);
            agendamento.setValor(new BigDecimal("180.00"));
            agendamento.setDesconto(BigDecimal.ZERO);
            agendamento.setFormaPagamento(FormaPagamento.PIX);
            agendamento.setStatus(StatusAgendamento.AGENDADO);
            agendamento.setTipoAgendamento(TipoAgendamento.CONSULTA);
            agendamento.setEncaixe(false);
            agendamento.setPago(false);
            agendamento.setUnidade(unidade);
            agendamento.setCriadoEm(LocalDateTime.now());
            agendamento.setExcluido(false);
            agendamentoRepository.save(agendamento);
        }

        // Act
        Page<Agendamento> page = agendamentoService.getByDate(usuario.getId(), hoje.getMonthValue(), hoje.getYear(), 0,
                10);

        // Assert
        assertNotNull(page);
        assertTrue(page.getTotalElements() >= 3);
        page.getContent().forEach(agendamento -> {
            assertNotNull(agendamento.getId());
            assertNotNull(agendamento.getPaciente());
            assertNotNull(agendamento.getProfissional());
        });
    }

    @Test
    @Order(6)
    @DisplayName("Deve editar um agendamento existente")
    @Transactional
    void testEditAgendamento() {
        // Arrange - Cria agendamento inicial
        LocalDate proximaSegunda = LocalDate.now().with(DayOfWeek.MONDAY);
        if (proximaSegunda.isBefore(LocalDate.now()) || proximaSegunda.isEqual(LocalDate.now())) {
            proximaSegunda = proximaSegunda.plusWeeks(1);
        }

        Agendamento agendamento = new Agendamento();
        agendamento.setPaciente(paciente);
        agendamento.setProfissional(profissional);
        agendamento.setEspecialidade(especialidade);
        agendamento.setData(proximaSegunda);
        agendamento.setHora(LocalTime.of(9, 0));
        agendamento.setDuracao(60);
        agendamento.setValor(new BigDecimal("180.00"));
        agendamento.setDesconto(BigDecimal.ZERO);
        agendamento.setFormaPagamento(FormaPagamento.PIX);
        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setTipoAgendamento(TipoAgendamento.CONSULTA);
        agendamento.setEncaixe(false);
        agendamento.setPago(false);
        agendamento.setUnidade(unidade);
        agendamento.setCriadoEm(LocalDateTime.now());
        agendamento.setExcluido(false);
        Agendamento saved = agendamentoRepository.save(agendamento);

        // Request de edição
        AgendamentoRequest request = new AgendamentoRequest(
                paciente.getId(),
                proximaSegunda,
                LocalTime.of(11, 0), // Muda horário
                especialidade.getId(),
                profissional.getId(),
                TipoAgendamento.CONSULTA, // tipoAgendamento
                procedimento.getId(),
                null, // empresaId
                null, // convenioId
                FormaPagamento.CARTAO_CREDITO,
                new BigDecimal("200.00"), // Muda valor
                new BigDecimal("20.00"),
                90, // Muda duração
                "Consulta atualizada",
                false, // precoAlterado
                false, // encaixe
                false, // pago
                null, // quantiaPaga
                null); // procedimentos

        // Act
        Agendamento updated = agendamentoService.editAgendamento(saved.getId(), request);

        // Assert
        assertNotNull(updated);
        assertEquals(saved.getId(), updated.getId());
        assertEquals(LocalTime.of(11, 0), updated.getHora());
        assertEquals(90, updated.getDuracao());
        assertEquals(new BigDecimal("200.00"), updated.getValor());
        assertEquals(FormaPagamento.CARTAO_CREDITO, updated.getFormaPagamento());
    }

    @Test
    @Order(7)
    @DisplayName("Deve buscar agendamento por token")
    @Transactional
    void testGetByToken() {
        // Arrange
        Agendamento agendamento = new Agendamento();
        agendamento.setPaciente(paciente);
        agendamento.setProfissional(profissional);
        agendamento.setData(LocalDate.now().plusDays(5));
        agendamento.setHora(LocalTime.of(15, 0));
        agendamento.setDuracao(60);
        agendamento.setValor(new BigDecimal("180.00"));
        agendamento.setDesconto(BigDecimal.ZERO);
        agendamento.setFormaPagamento(FormaPagamento.PIX);
        agendamento.setStatus(StatusAgendamento.AGENDADO);
        agendamento.setTipoAgendamento(TipoAgendamento.CONSULTA);
        agendamento.setEncaixe(true);
        agendamento.setPago(false);
        agendamento.setUnidade(unidade);
        agendamento.setCriadoEm(LocalDateTime.now());
        agendamento.setExcluido(false);
        Agendamento saved = agendamentoRepository.save(agendamento);

        // Act
        Agendamento found = agendamentoService.getByToken(saved.getTokenPublico());

        // Assert
        assertNotNull(found);
        assertEquals(saved.getId(), found.getId());
        assertEquals(saved.getTokenPublico(), found.getTokenPublico());
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }
}
