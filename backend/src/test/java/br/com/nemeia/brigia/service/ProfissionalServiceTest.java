package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.ProfissionalRequest;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ProfissionalMapper;
import br.com.nemeia.brigia.model.Especialidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.model.Unidade;
import br.com.nemeia.brigia.model.Usuario;
import br.com.nemeia.brigia.repository.EspecialidadeRepository;
import br.com.nemeia.brigia.repository.ProfissionalRepository;
import br.com.nemeia.brigia.repository.UsuarioRepository;
import org.apache.coyote.BadRequestException;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * Testes unitários para ProfissionalService.
 * Utiliza Mockito para mockar as dependências, eliminando a necessidade de conexão com banco de dados.
 */
@ExtendWith(MockitoExtension.class)
class ProfissionalServiceTest {

    @Mock
    private ProfissionalRepository profissionalRepository;

    @Mock
    private UsuarioRepository usuarioRepository;

    @Mock
    private UsuarioService usuarioService;

    @Mock
    private EspecialidadeRepository especialidadeRepository;

    @Mock
    private EspecialidadeService especialidadeService;

    @Mock
    private UnidadeService unidadeService;

    @Mock
    private ProfissionalMapper profissionalMapper;

    @InjectMocks
    private ProfissionalService profissionalService;

    private Profissional profissionalTest;
    private Usuario usuarioTest;
    private Unidade unidadeTest;

    @BeforeEach
    void setUp() {
        // Configura dados de teste
        unidadeTest = new Unidade();
        unidadeTest.setId(1L);
        unidadeTest.setNome("Unidade Teste");

        usuarioTest = new Usuario();
        usuarioTest.setId(1L);
        usuarioTest.setEmail("teste@test.com");
        usuarioTest.setNome("Usuário Teste");

        profissionalTest = new Profissional();
        profissionalTest.setId(1L);
        profissionalTest.setNome("Profissional Teste");
        profissionalTest.setEmail("profissional@test.com");
        profissionalTest.setCpf("12345678901");
        profissionalTest.setDataNascimento(LocalDate.of(1990, 1, 1));
        profissionalTest.setSexo('M');
        profissionalTest.setCelular("11999999999");
        profissionalTest.setValorHora(BigDecimal.valueOf(100));
        profissionalTest.setUnidade(unidadeTest);
        profissionalTest.setUsuario(usuarioTest);
        profissionalTest.setExcluido(false);

        SecurityHolder.setLoggedUserUnidadeId(1L);
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
        reset(profissionalRepository, usuarioRepository, usuarioService, especialidadeRepository,
              especialidadeService, unidadeService, profissionalMapper);
    }

    // ==================== Testes de Listagem ====================

    @Test
    void deveListarProfissionaisPaginados() {
        // Arrange
        Profissional prof1 = new Profissional();
        prof1.setId(1L);
        prof1.setNome("Profissional 1");
        prof1.setEmail("prof1@test.com");

        Profissional prof2 = new Profissional();
        prof2.setId(2L);
        prof2.setNome("Profissional 2");
        prof2.setEmail("prof2@test.com");

        List<Profissional> profissionais = List.of(prof1, prof2);
        Page<Profissional> page = new PageImpl<>(profissionais, PageRequest.of(0, 10), 2);

        when(profissionalRepository.findAll(any(PageRequest.class))).thenReturn(page);

        // Act
        Page<Profissional> resultado = profissionalService.getPaged(0, 10);

        // Assert
        assertNotNull(resultado);
        assertEquals(2, resultado.getContent().size());
        verify(profissionalRepository, times(1)).findAll(any(PageRequest.class));
    }

    @Test
    void deveRetornarPaginaVaziaQuandoNaoHouverProfissionais() {
        // Arrange
        Page<Profissional> emptyPage = new PageImpl<>(List.of(), PageRequest.of(0, 10), 0);
        when(profissionalRepository.findAll(any(PageRequest.class))).thenReturn(emptyPage);

        // Act
        Page<Profissional> resultado = profissionalService.getPaged(0, 10);

        // Assert
        assertNotNull(resultado);
        assertEquals(0, resultado.getContent().size());
        verify(profissionalRepository, times(1)).findAll(any(PageRequest.class));
    }

    @Test
    void deveListarAniversariantesDoDia() {
        // Arrange
        Profissional aniversariante = new Profissional();
        aniversariante.setId(1L);
        aniversariante.setNome("João Silva");
        aniversariante.setDataNascimento(LocalDate.now());

        when(profissionalRepository.findAllByDataNascimentoIs(LocalDate.now()))
                .thenReturn(List.of(aniversariante));

        // Act
        List<Profissional> aniversariantes = profissionalService.getAniversariantes();

        // Assert
        assertNotNull(aniversariantes);
        assertEquals(1, aniversariantes.size());
        assertEquals("João Silva", aniversariantes.getFirst().getNome());
        verify(profissionalRepository, times(1)).findAllByDataNascimentoIs(LocalDate.now());
    }

    @Test
    void deveRetornarListaVaziaQuandoNaoHouverAniversariantes() {
        // Arrange
        when(profissionalRepository.findAllByDataNascimentoIs(LocalDate.now()))
                .thenReturn(List.of());

        // Act
        List<Profissional> aniversariantes = profissionalService.getAniversariantes();

        // Assert
        assertNotNull(aniversariantes);
        assertEquals(0, aniversariantes.size());
        verify(profissionalRepository, times(1)).findAllByDataNascimentoIs(LocalDate.now());
    }

    // ==================== Testes de Busca ====================

    @Test
    void deveObterProfissionalPorId() {
        // Arrange
        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));

        // Act
        Profissional resultado = profissionalService.getById(1L);

        // Assert
        assertNotNull(resultado);
        assertEquals(1L, resultado.getId());
        assertEquals("profissional@test.com", resultado.getEmail());
        verify(profissionalRepository, times(1)).findById(1L);
    }

    @Test
    void deveLancarExcecaoAoObterProfissionalInexistente() {
        // Arrange
        when(profissionalRepository.findById(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.getById(999L));
        verify(profissionalRepository, times(1)).findById(999L);
    }

    @Test
    void deveObterProfissionalPorUsuarioId() {
        // Arrange
        when(profissionalRepository.findOneByUsuarioIdIs(1L)).thenReturn(Optional.of(profissionalTest));

        // Act
        Profissional resultado = profissionalService.getByUsuarioId(1L);

        // Assert
        assertNotNull(resultado);
        assertEquals(1L, resultado.getId());
        verify(profissionalRepository, times(1)).findOneByUsuarioIdIs(1L);
    }

    @Test
    void deveLancarExcecaoAoObterProfissionalPorUsuarioIdInexistente() {
        // Arrange
        when(profissionalRepository.findOneByUsuarioIdIs(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.getByUsuarioId(999L));
        verify(profissionalRepository, times(1)).findOneByUsuarioIdIs(999L);
    }

    // ==================== Testes de Criação ====================

    @Test
    void deveCriarProfissionalComEmail() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Maria Santos",
                "maria@test.com",
                "98765432100",
                LocalDate.of(1990, 5, 15),
                "F",
                "11988888888",
                null,
                "654321",
                null,
                BigDecimal.valueOf(150),
                List.of()
        );

        Profissional novoProfissional = new Profissional();
        novoProfissional.setId(2L);
        novoProfissional.setNome("Maria Santos");
        novoProfissional.setEmail("maria@test.com");
        novoProfissional.setUnidade(unidadeTest);
        novoProfissional.setUsuario(usuarioTest);

        when(profissionalMapper.toEntity(request)).thenReturn(novoProfissional);
        when(unidadeService.getById(1L)).thenReturn(unidadeTest);
        when(usuarioService.getByEmail("maria@test.com")).thenReturn(Optional.empty());
        when(usuarioService.create(any())).thenReturn(usuarioTest);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(novoProfissional);

        // Act
        assertDoesNotThrow(() -> {
            Profissional resultado = profissionalService.createProfissional(request);

            // Assert
            assertNotNull(resultado);
            assertEquals("Maria Santos", resultado.getNome());
            assertEquals("maria@test.com", resultado.getEmail());
            assertNotNull(resultado.getUsuario());
        });
    }

    @Test
    void deveCriarProfissionalSemEmail() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Carlos Oliveira",
                "", // Email vazio
                "11122233344",
                LocalDate.of(1985, 3, 10),
                "M",
                "11977777777",
                null,
                "111222",
                null,
                BigDecimal.valueOf(120),
                List.of()
        );

        Profissional novoProfissional = new Profissional();
        novoProfissional.setId(3L);
        novoProfissional.setNome("Carlos Oliveira");
        novoProfissional.setEmail("");
        novoProfissional.setUnidade(unidadeTest);

        when(profissionalMapper.toEntity(request)).thenReturn(novoProfissional);
        when(unidadeService.getById(1L)).thenReturn(unidadeTest);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(novoProfissional);

        // Act
        assertDoesNotThrow(() -> {
            Profissional resultado = profissionalService.createProfissional(request);

            // Assert
            assertNotNull(resultado);
            assertEquals("Carlos Oliveira", resultado.getNome());
            assertNull(resultado.getUsuario());
            verify(usuarioService, never()).create(any());
        });
    }

    @Test
    void deveLancarExcecaoAoCriarProfissionalComEmailDuplicado() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Ana Silva",
                "ana@test.com",
                "55566677788",
                LocalDate.of(1992, 7, 20),
                "F",
                "11966666666",
                null,
                "999888",
                null,
                BigDecimal.valueOf(100),
                List.of()
        );

        Profissional novoProfissional = new Profissional();
        novoProfissional.setEmail("ana@test.com");

        when(profissionalMapper.toEntity(request)).thenReturn(novoProfissional);
        when(usuarioService.getByEmail("ana@test.com")).thenReturn(Optional.of(usuarioTest));

        // Act & Assert
        assertThrows(BadRequestException.class, () -> profissionalService.createProfissional(request));
    }

    @Test
    void deveCriarProfissionalComEspecialidades() {
        // Arrange
        Especialidade especialidade = new Especialidade();
        especialidade.setId(1L);
        especialidade.setNome("Pediatria");

        ProfissionalRequest request = new ProfissionalRequest(
                "Pediatra João",
                "pediatra@test.com",
                "44455566677",
                LocalDate.of(1988, 4, 12),
                "M",
                "11944444444",
                null,
                "555444",
                null,
                BigDecimal.valueOf(200),
                List.of(1L)
        );

        Profissional novoProfissional = new Profissional();
        novoProfissional.setId(4L);
        novoProfissional.setNome("Pediatra João");
        novoProfissional.setEmail("pediatra@test.com");
        novoProfissional.setUnidade(unidadeTest);
        novoProfissional.setEspecialidades(List.of(especialidade));
        novoProfissional.setUsuario(usuarioTest);

        when(profissionalMapper.toEntity(request)).thenReturn(novoProfissional);
        when(especialidadeService.getById(1L)).thenReturn(especialidade);
        when(unidadeService.getById(1L)).thenReturn(unidadeTest);
        when(usuarioService.getByEmail("pediatra@test.com")).thenReturn(Optional.empty());
        when(usuarioService.create(any())).thenReturn(usuarioTest);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(novoProfissional);

        // Act
        assertDoesNotThrow(() -> {
            Profissional resultado = profissionalService.createProfissional(request);

            // Assert
            assertNotNull(resultado);
            assertEquals("Pediatra João", resultado.getNome());
            assertNotNull(resultado.getEspecialidades());
        });
    }

    // ==================== Testes de Edição ====================

    @Test
    void deveEditarProfissional() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "João Atualizado",
                profissionalTest.getEmail(),
                "99988877766",
                LocalDate.of(1989, 8, 8),
                "M",
                "11933333333",
                "http://imagem.com",
                "333222",
                null,
                BigDecimal.valueOf(180),
                List.of()
        );

        Profissional profissionalMapeado = new Profissional();
        profissionalMapeado.setNome("João Atualizado");
        profissionalMapeado.setEmail(profissionalTest.getEmail());
        profissionalMapeado.setUrlImagem("http://imagem.com");
        profissionalMapeado.setValorHora(BigDecimal.valueOf(180));

        Profissional profissionalAtualizado = new Profissional();
        profissionalAtualizado.setId(1L);
        profissionalAtualizado.setNome("João Atualizado");
        profissionalAtualizado.setEmail(profissionalTest.getEmail());
        profissionalAtualizado.setUrlImagem("http://imagem.com");
        profissionalAtualizado.setValorHora(BigDecimal.valueOf(180));
        profissionalAtualizado.setUnidade(unidadeTest);
        profissionalAtualizado.setUsuario(usuarioTest);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalMapper.toEntity(request)).thenReturn(profissionalMapeado);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalAtualizado);

        // Act
        Profissional resultado = profissionalService.editProfissional(1L, request);

        // Assert
        assertNotNull(resultado);
        assertEquals("João Atualizado", resultado.getNome());
        assertEquals("http://imagem.com", resultado.getUrlImagem());
        assertEquals(BigDecimal.valueOf(180), resultado.getValorHora());
        verify(profissionalRepository, times(1)).findById(1L);
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveManterUnidadeAoEditarProfissional() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Nome Atualizado",
                profissionalTest.getEmail(),
                "77788899900",
                LocalDate.of(1991, 6, 6),
                "F",
                "11922222222",
                null,
                "444333",
                null,
                BigDecimal.valueOf(160),
                List.of()
        );

        Profissional profissionalMapeado = new Profissional();
        profissionalMapeado.setNome("Nome Atualizado");

        Profissional profissionalAtualizado = new Profissional();
        profissionalAtualizado.setId(1L);
        profissionalAtualizado.setNome("Nome Atualizado");
        profissionalAtualizado.setUnidade(unidadeTest);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalMapper.toEntity(request)).thenReturn(profissionalMapeado);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalAtualizado);

        // Act
        Profissional resultado = profissionalService.editProfissional(1L, request);

        // Assert
        assertEquals(unidadeTest.getId(), resultado.getUnidade().getId());
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveManterUsuarioAoEditarProfissional() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Nome Atualizado",
                profissionalTest.getEmail(),
                "66677788899",
                LocalDate.of(1993, 9, 9),
                "M",
                "11911111111",
                null,
                "222111",
                null,
                BigDecimal.valueOf(170),
                List.of()
        );

        Profissional profissionalMapeado = new Profissional();
        profissionalMapeado.setNome("Nome Atualizado");

        Profissional profissionalAtualizado = new Profissional();
        profissionalAtualizado.setId(1L);
        profissionalAtualizado.setNome("Nome Atualizado");
        profissionalAtualizado.setUsuario(usuarioTest);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalMapper.toEntity(request)).thenReturn(profissionalMapeado);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalAtualizado);

        // Act
        Profissional resultado = profissionalService.editProfissional(1L, request);

        // Assert
        assertEquals(usuarioTest.getId(), resultado.getUsuario().getId());
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveLancarExcecaoAoEditarProfissionalInexistente() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Teste",
                "teste@test.com",
                "11223344556",
                LocalDate.of(1980, 1, 1),
                "M",
                "11900000000",
                null,
                "000111",
                null,
                BigDecimal.valueOf(100),
                List.of()
        );

        when(profissionalRepository.findById(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.editProfissional(999L, request));
        verify(profissionalRepository, times(1)).findById(999L);
    }

    // ==================== Testes de Reenvio de Convite ====================

    @Test
    void deveReenviarConviteParaProfissionalComUsuario() {
        // Arrange
        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));

        // Act & Assert
        assertDoesNotThrow(() -> profissionalService.reenviarConvite(1L));
        verify(profissionalRepository, times(1)).findById(1L);
        verify(usuarioService, times(1)).reenviarConvite(1L);
    }

    @Test
    void deveLancarExcecaoAoReenviarConviteSemEmailESemUsuario() {
        // Arrange
        Profissional profissionalSemEmail = new Profissional();
        profissionalSemEmail.setId(2L);
        profissionalSemEmail.setNome("Profissional Sem Email");
        profissionalSemEmail.setEmail("");

        when(profissionalRepository.findById(2L)).thenReturn(Optional.of(profissionalSemEmail));

        // Act & Assert
        assertThrows(BadRequestException.class, () -> profissionalService.reenviarConvite(2L));
        verify(profissionalRepository, times(1)).findById(2L);
    }

    @Test
    void deveLancarExcecaoAoReenviarConviteParaProfissionalInexistente() {
        // Arrange
        when(profissionalRepository.findById(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.reenviarConvite(999L));
        verify(profissionalRepository, times(1)).findById(999L);
    }

    // ==================== Testes de Deleção ====================

    @Test
    void deveDeletarProfissional() {
        // Arrange
        Profissional profissionalDeletado = new Profissional();
        profissionalDeletado.setId(1L);
        profissionalDeletado.setNome("Profissional Teste");
        profissionalDeletado.setExcluido(true);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalDeletado);

        // Act
        profissionalService.deleteProfissional(1L);

        // Assert
        verify(profissionalRepository, times(1)).findById(1L);
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveLancarExcecaoAoDeletarProfissionalInexistente() {
        // Arrange
        when(profissionalRepository.findById(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.deleteProfissional(999L));
        verify(profissionalRepository, times(1)).findById(999L);
    }

    // ==================== Testes de Restauração ====================

    @Test
    void deveRestaurarProfissionalDeletado() {
        // Arrange
        Profissional profissionalDeletado = new Profissional();
        profissionalDeletado.setId(1L);
        profissionalDeletado.setNome("Profissional Teste");
        profissionalDeletado.setExcluido(true);

        Profissional profissionalRestaurado = new Profissional();
        profissionalRestaurado.setId(1L);
        profissionalRestaurado.setNome("Profissional Teste");
        profissionalRestaurado.setExcluido(false);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalDeletado));
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalRestaurado);

        // Act
        Profissional resultado = profissionalService.restaurarProfissional(1L);

        // Assert
        assertNotNull(resultado);
        assertFalse(resultado.getExcluido());
        verify(profissionalRepository, times(1)).findById(1L);
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveLancarExcecaoAoRestaurarProfissionalInexistente() {
        // Arrange
        when(profissionalRepository.findById(999L)).thenReturn(Optional.empty());

        // Act & Assert
        assertThrows(NotFoundException.class, () -> profissionalService.restaurarProfissional(999L));
        verify(profissionalRepository, times(1)).findById(999L);
    }

    // ==================== Testes Adicionais de Edição ====================

    @Test
    void deveEditarProfissionalComEspecialidades() {
        // Arrange
        Especialidade especialidade1 = new Especialidade();
        especialidade1.setId(1L);
        especialidade1.setNome("Cardiologia");

        Especialidade especialidade2 = new Especialidade();
        especialidade2.setId(2L);
        especialidade2.setNome("Ortopedia");

        ProfissionalRequest request = new ProfissionalRequest(
                "João Atualizado",
                profissionalTest.getEmail(),
                "99988877766",
                LocalDate.of(1989, 8, 8),
                "M",
                "11933333333",
                null,
                "333222",
                null,
                BigDecimal.valueOf(180),
                List.of(1L, 2L)
        );

        Profissional profissionalMapeado = new Profissional();
        profissionalMapeado.setNome("João Atualizado");
        profissionalMapeado.setEmail(profissionalTest.getEmail());

        Profissional profissionalAtualizado = new Profissional();
        profissionalAtualizado.setId(1L);
        profissionalAtualizado.setNome("João Atualizado");
        profissionalAtualizado.setEmail(profissionalTest.getEmail());
        profissionalAtualizado.setEspecialidades(List.of(especialidade1, especialidade2));
        profissionalAtualizado.setUnidade(unidadeTest);
        profissionalAtualizado.setUsuario(usuarioTest);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalMapper.toEntity(request)).thenReturn(profissionalMapeado);
        when(especialidadeService.getById(1L)).thenReturn(especialidade1);
        when(especialidadeService.getById(2L)).thenReturn(especialidade2);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalAtualizado);

        // Act
        Profissional resultado = profissionalService.editProfissional(1L, request);

        // Assert
        assertNotNull(resultado);
        assertEquals(2, resultado.getEspecialidades().size());
        verify(especialidadeService, times(1)).getById(1L);
        verify(especialidadeService, times(1)).getById(2L);
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    @Test
    void deveEditarProfissionalSemEspecialidades() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "João Sem Especialidades",
                profissionalTest.getEmail(),
                "99988877766",
                LocalDate.of(1989, 8, 8),
                "M",
                "11933333333",
                null,
                "333222",
                null,
                BigDecimal.valueOf(180),
                List.of() // Lista vazia
        );

        Profissional profissionalMapeado = new Profissional();
        profissionalMapeado.setNome("João Sem Especialidades");

        Profissional profissionalAtualizado = new Profissional();
        profissionalAtualizado.setId(1L);
        profissionalAtualizado.setNome("João Sem Especialidades");
        profissionalAtualizado.setUnidade(unidadeTest);

        when(profissionalRepository.findById(1L)).thenReturn(Optional.of(profissionalTest));
        when(profissionalMapper.toEntity(request)).thenReturn(profissionalMapeado);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalAtualizado);

        // Act
        Profissional resultado = profissionalService.editProfissional(1L, request);

        // Assert
        assertNotNull(resultado);
        verify(especialidadeService, never()).getById(anyLong());
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
    }

    // ==================== Testes Adicionais de Reenvio de Convite ====================

    @Test
    void deveVincularUsuarioExistenteEReenviarConvite() {
        // Arrange
        Profissional profissionalSemUsuario = new Profissional();
        profissionalSemUsuario.setId(2L);
        profissionalSemUsuario.setNome("Profissional Sem Usuário");
        profissionalSemUsuario.setEmail("existente@test.com");
        profissionalSemUsuario.setUsuario(null);

        Usuario usuarioExistente = new Usuario();
        usuarioExistente.setId(5L);
        usuarioExistente.setEmail("existente@test.com");
        usuarioExistente.setNome("Usuario Existente");

        when(profissionalRepository.findById(2L)).thenReturn(Optional.of(profissionalSemUsuario));
        when(usuarioService.getByEmail("existente@test.com")).thenReturn(Optional.of(usuarioExistente));
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(profissionalSemUsuario);

        // Act
        assertDoesNotThrow(() -> profissionalService.reenviarConvite(2L));

        // Assert
        verify(profissionalRepository, times(1)).findById(2L);
        verify(usuarioService, times(1)).getByEmail("existente@test.com");
        verify(profissionalRepository, times(1)).save(any(Profissional.class));
        verify(usuarioService, times(1)).reenviarConvite(5L);
    }

    @Test
    void deveLancarExcecaoAoReenviarConviteSemUsuarioEComEmailNulo() {
        // Arrange
        Profissional profissionalSemEmail = new Profissional();
        profissionalSemEmail.setId(3L);
        profissionalSemEmail.setNome("Profissional Sem Email");
        profissionalSemEmail.setEmail(null);
        profissionalSemEmail.setUsuario(null);

        when(profissionalRepository.findById(3L)).thenReturn(Optional.of(profissionalSemEmail));

        // Act & Assert
        assertThrows(BadRequestException.class, () -> profissionalService.reenviarConvite(3L));
        verify(profissionalRepository, times(1)).findById(3L);
        verify(usuarioService, never()).reenviarConvite(anyLong());
    }

    // ==================== Testes Adicionais de Criação ====================

    @Test
    void deveCriarProfissionalComEmailNulo() {
        // Arrange
        ProfissionalRequest request = new ProfissionalRequest(
                "Paulo Nulo",
                null, // Email nulo
                "33344455566",
                LocalDate.of(1987, 2, 14),
                "M",
                "11955555555",
                null,
                "666777",
                null,
                BigDecimal.valueOf(130),
                List.of()
        );

        Profissional novoProfissional = new Profissional();
        novoProfissional.setId(5L);
        novoProfissional.setNome("Paulo Nulo");
        novoProfissional.setEmail(null);
        novoProfissional.setUnidade(unidadeTest);

        when(profissionalMapper.toEntity(request)).thenReturn(novoProfissional);
        when(unidadeService.getById(1L)).thenReturn(unidadeTest);
        when(profissionalRepository.save(any(Profissional.class))).thenReturn(novoProfissional);

        // Act
        assertDoesNotThrow(() -> {
            Profissional resultado = profissionalService.createProfissional(request);

            // Assert
            assertNotNull(resultado);
            assertEquals("Paulo Nulo", resultado.getNome());
            assertNull(resultado.getUsuario());
            verify(usuarioService, never()).create(any());
        });
    }

}
