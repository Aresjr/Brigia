package br.com.nemeia.brigia.service;

import static org.junit.jupiter.api.Assertions.*;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.AtendimentoRequest;
import br.com.nemeia.brigia.model.*;
import br.com.nemeia.brigia.repository.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Collections;
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
@DisplayName("AtendimentoService - Teste de Integração com Banco de Dados")
class AtendimentoServiceIntegrationTest {

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
    private AtendimentoService atendimentoService;

    @Autowired
    private AtendimentoRepository atendimentoRepository;

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
    private UsuarioRepository usuarioRepository;

    private Unidade unidade;
    private Paciente paciente;
    private Profissional profissional;
    private Empresa empresa;
    private Convenio convenio;
    private Especialidade especialidade;
    private Agendamento agendamento;
    private Usuario usuario;

    @BeforeEach
    @Transactional
    void setUp() {
        // Limpa os dados antes de cada teste
        atendimentoRepository.deleteAll();
        agendamentoRepository.deleteAll();
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
        especialidade.setNome("Fisioterapia");
        especialidade.setCriadoEm(LocalDateTime.now());
        especialidade.setExcluido(false);
        especialidade = especialidadeRepository.save(especialidade);

        // Cria paciente
        paciente = new Paciente();
        paciente.setNome("Paula Ferreira");
        paciente.setCpf("99988877766");
        paciente.setDataNascimento(LocalDate.of(1998, 5, 20));
        paciente.setSexo('F');
        paciente.setCelular("47955554444");
        paciente.setUnidade(unidade);
        paciente.setCriadoEm(LocalDateTime.now());
        paciente.setExcluido(false);
        paciente = pacienteRepository.save(paciente);

        // Cria usuário
        usuario = new Usuario();
        usuario.setNome("Dra. Juliana Souza");
        usuario.setEmail("juliana@email.com");
        usuario.setSenha("senha123");
        usuario.setRoles(Collections.singletonList(RoleUsuario.MEDICO));
        usuario.setUnidade(unidade);
        usuario.setCriadoEm(LocalDateTime.now());
        usuario.setExcluido(false);
        usuario = usuarioRepository.save(usuario);

        // Configura usuário logado
        SecurityHolder.setLoggedUserUnidadeId(unidade.getId());

        // Cria profissional
        profissional = new Profissional();
        profissional.setNome("Dra. Juliana Souza");
        profissional.setCpf("77788899900");
        profissional.setDataNascimento(LocalDate.of(1982, 12, 15));
        profissional.setSexo('F');
        profissional.setCelular("47944443333");
        profissional.setUsuario(usuario);
        profissional.setUnidade(unidade);
        profissional.setCriadoEm(LocalDateTime.now());
        profissional.setExcluido(false);
        profissional = profissionalRepository.save(profissional);

        // Cria empresa
        empresa = new Empresa();
        empresa.setNome("Indústria XYZ LTDA");
        empresa.setCnpj("88877766000155");
        empresa.setEmail("contato@industriaxyz.com");
        empresa.setCriadoEm(LocalDateTime.now());
        empresa.setExcluido(false);
        empresa = empresaRepository.save(empresa);

        // Cria convênio
        convenio = new Convenio();
        convenio.setNome("SulAmérica");
        convenio.setUnidade(unidade);
        convenio.setCriadoEm(LocalDateTime.now());
        convenio.setExcluido(false);
        convenio = convenioRepository.save(convenio);

        // Cria agendamento
        agendamento = new Agendamento();
        agendamento.setPaciente(paciente);
        agendamento.setProfissional(profissional);
        agendamento.setEspecialidade(especialidade);
        agendamento.setEmpresa(empresa);
        agendamento.setConvenio(convenio);
        agendamento.setData(LocalDate.now());
        agendamento.setHora(LocalTime.of(14, 0));
        agendamento.setDuracao(60);
        agendamento.setValor(new BigDecimal("220.00"));
        agendamento.setDesconto(new BigDecimal("22.00"));
        agendamento.setFormaPagamento(FormaPagamento.CARTAO_DEBITO);
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
    @DisplayName("Deve iniciar um atendimento a partir de um agendamento")
    @Transactional
    void testIniciarAtendimento() {
        // Act
        Atendimento atendimento = atendimentoService.iniciarAtendimento(agendamento.getId());

        // Assert
        assertNotNull(atendimento.getId());
        assertEquals(StatusAtendimento.EM_ATENDIMENTO, atendimento.getStatus());
        assertEquals(paciente.getId(), atendimento.getPaciente().getId());
        assertEquals(profissional.getId(), atendimento.getProfissional().getId());
        assertEquals(agendamento.getId(), atendimento.getAgendamento().getId());
        assertEquals(LocalDate.now(), atendimento.getData());
        assertNotNull(atendimento.getHoraInicio());

        // Verifica se o status do agendamento foi atualizado
        Agendamento agendamentoAtualizado = agendamentoRepository.findById(agendamento.getId()).orElseThrow();
        assertEquals(StatusAgendamento.EM_ATENDIMENTO, agendamentoAtualizado.getStatus());
    }

    @Test
    @Order(2)
    @DisplayName("Deve finalizar um atendimento em andamento")
    @Transactional
    void testFinalizarAtendimento() {
        // Arrange - Inicia o atendimento primeiro
        Atendimento atendimento = atendimentoService.iniciarAtendimento(agendamento.getId());

        AtendimentoRequest request = new AtendimentoRequest(
                null, // id
                agendamento.getId(), // agendamentoId
                null, // horaInicio
                "Paciente relatou dores nas costas", // anamnese
                "Lombalgia", // diagnostico
                "Melhora após sessão de fisioterapia", // evolucaoClinica
                "Postura inadequada, tensão muscular", // exameFisico
                "Ressonância magnética da coluna lombar", // examesSolicitados
                "Analgésicos e relaxantes musculares conforme necessário", // prescricoes
                null, // procedimentos
                "Retornar em 1 semana"); // observacoes

        // Act
        Atendimento finalizado = atendimentoService.finalizarAtendimento(atendimento.getId(), request);

        // Assert
        assertNotNull(finalizado);
        assertEquals(StatusAtendimento.FINALIZADO, finalizado.getStatus());
        assertEquals("Paciente relatou dores nas costas", finalizado.getAnamnese());
        assertEquals("Postura inadequada, tensão muscular", finalizado.getExameFisico());
        assertEquals("Lombalgia", finalizado.getDiagnostico());
        assertNotNull(finalizado.getHoraFim());

        // Verifica se o agendamento foi marcado como finalizado
        Agendamento agendamentoFinalizado = agendamentoRepository.findById(agendamento.getId()).orElseThrow();
        assertEquals(StatusAgendamento.FINALIZADO, agendamentoFinalizado.getStatus());

        // Verifica se a data da última consulta do paciente foi atualizada
        Paciente pacienteAtualizado = pacienteRepository.findById(paciente.getId()).orElseThrow();
        assertNotNull(pacienteAtualizado.getUltimaConsulta());
    }

    @Test
    @Order(3)
    @DisplayName("Deve criar atendimento e finalizar em uma única operação")
    @Transactional
    void testCreateAtendimento() {
        // Arrange
        AtendimentoRequest request = new AtendimentoRequest(
                null, // id
                agendamento.getId(), // agendamentoId
                null, // horaInicio
                "Paciente com queixa de dores no ombro", // anamnese
                "Tendinite no ombro direito", // diagnostico
                "Aplicação de gelo e ultrassom terapêutico", // evolucaoClinica
                "Movimento limitado, sensibilidade à palpação", // exameFisico
                "Ultrassom do ombro direito", // examesSolicitados
                "Anti-inflamatórios e fisioterapia", // prescricoes
                null, // procedimentos
                "Sessões de fisioterapia 3x por semana"); // observacoes

        // Act
        Atendimento atendimento = atendimentoService.createAtendimento(request);

        // Assert
        assertNotNull(atendimento.getId());
        assertEquals(paciente.getId(), atendimento.getPaciente().getId());
        assertEquals(profissional.getId(), atendimento.getProfissional().getId());
        assertEquals("Paciente com queixa de dores no ombro", atendimento.getAnamnese());
        assertEquals("Tendinite no ombro direito", atendimento.getDiagnostico());
        assertEquals(LocalDate.now(), atendimento.getData());
        assertNotNull(atendimento.getHoraFim());

        // Verifica se o agendamento foi marcado como finalizado
        Agendamento agendamentoFinalizado = agendamentoRepository.findById(agendamento.getId()).orElseThrow();
        assertEquals(StatusAgendamento.FINALIZADO, agendamentoFinalizado.getStatus());
    }

    @Test
    @Order(4)
    @DisplayName("Deve listar atendimentos paginados")
    @Transactional
    void testGetPaged() {
        // Arrange - Cria 3 atendimentos
        for (int i = 0; i < 3; i++) {
            Atendimento atendimento = new Atendimento();
            atendimento.setPaciente(paciente);
            atendimento.setProfissional(profissional);
            atendimento.setEspecialidade(especialidade);
            atendimento.setEmpresa(empresa);
            atendimento.setConvenio(convenio);
            atendimento.setAgendamento(agendamento);
            atendimento.setData(LocalDate.now());
            atendimento.setHoraInicio(LocalTime.of(10 + i, 0));
            atendimento.setHoraFim(LocalTime.of(11 + i, 0));
            atendimento.setValorAgendamento(new BigDecimal("220.00"));
            atendimento.setValorDescontoAgendamento(new BigDecimal("22.00"));
            atendimento.setValorLancado(new BigDecimal("0.00"));
            atendimento.setFormaPagamento(FormaPagamento.CARTAO_DEBITO);
            atendimento.setStatus(StatusAtendimento.FINALIZADO);
            atendimento.setUnidade(unidade);
            atendimento.setCriadoEm(LocalDateTime.now());
            atendimento.setExcluido(false);
            atendimentoRepository.save(atendimento);
        }

        // Act
        Page<Atendimento> page = atendimentoService.getPaged(0, 10);

        // Assert
        assertNotNull(page);
        assertEquals(3, page.getTotalElements());
        assertEquals(1, page.getTotalPages());
        assertEquals(3, page.getContent().size());

        page.getContent().forEach(atendimento -> {
            assertNotNull(atendimento.getId());
            assertNotNull(atendimento.getPaciente());
            assertNotNull(atendimento.getProfissional());
            assertEquals(StatusAtendimento.FINALIZADO, atendimento.getStatus());
        });
    }

    @Test
    @Order(5)
    @DisplayName("Deve buscar atendimento por ID")
    @Transactional
    void testGetById() {
        // Arrange
        Atendimento atendimento = new Atendimento();
        atendimento.setPaciente(paciente);
        atendimento.setProfissional(profissional);
        atendimento.setAgendamento(agendamento);
        atendimento.setData(LocalDate.now());
        atendimento.setHoraInicio(LocalTime.of(9, 0));
        atendimento.setHoraFim(LocalTime.of(10, 0));
        atendimento.setValorAgendamento(new BigDecimal("220.00"));
        atendimento.setValorDescontoAgendamento(BigDecimal.ZERO);
        atendimento.setValorLancado(BigDecimal.ZERO);
        atendimento.setFormaPagamento(FormaPagamento.PIX);
        atendimento.setStatus(StatusAtendimento.FINALIZADO);
        atendimento.setUnidade(unidade);
        atendimento.setCriadoEm(LocalDateTime.now());
        atendimento.setExcluido(false);
        Atendimento saved = atendimentoRepository.save(atendimento);

        // Act
        Atendimento found = atendimentoService.getById(saved.getId());

        // Assert
        assertNotNull(found);
        assertEquals(saved.getId(), found.getId());
        assertEquals(paciente.getId(), found.getPaciente().getId());
        assertEquals(profissional.getId(), found.getProfissional().getId());
    }

    @Test
    @Order(6)
    @DisplayName("Deve manter valores do agendamento ao iniciar atendimento")
    @Transactional
    void testIniciarAtendimentoMantémValores() {
        // Act
        Atendimento atendimento = atendimentoService.iniciarAtendimento(agendamento.getId());

        // Assert
        assertEquals(agendamento.getConvenio().getId(), atendimento.getConvenio().getId());
        assertEquals(agendamento.getEmpresa().getId(), atendimento.getEmpresa().getId());
        assertEquals(agendamento.getEspecialidade().getId(), atendimento.getEspecialidade().getId());
        assertEquals(agendamento.getFormaPagamento(), atendimento.getFormaPagamento());
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }
}
