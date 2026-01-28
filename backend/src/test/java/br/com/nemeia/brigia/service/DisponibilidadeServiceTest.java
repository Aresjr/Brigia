package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.dto.request.DisponibilidadeRequest;
import br.com.nemeia.brigia.exception.ConflitoBlocoHorarioException;
import br.com.nemeia.brigia.mapper.DisponibilidadeMapper;
import br.com.nemeia.brigia.model.Disponibilidade;
import br.com.nemeia.brigia.model.Profissional;
import br.com.nemeia.brigia.repository.DisponibilidadeRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class DisponibilidadeServiceTest {

    @Mock
    private DisponibilidadeRepository disponibilidadeRepository;

    @Mock
    private DisponibilidadeMapper disponibilidadeMapper;

    @Mock
    private ProfissionalService profissionalService;

    @InjectMocks
    private DisponibilidadeService disponibilidadeService;

    private Profissional profissional;
    private Disponibilidade disponibilidade;

    @BeforeEach
    void setUp() {
        SecurityHolder.setLoggedUserUnidadeId(1L);

        // Setup mock objects
        profissional = new Profissional();
        profissional.setId(1L);
        profissional.setNome("Dr. João");

        disponibilidade = new Disponibilidade();
        disponibilidade.setId(1L);
        disponibilidade.setProfissional(profissional);
        disponibilidade.setDia(LocalDate.of(2025, 10, 20));
        disponibilidade.setHoraInicial(LocalTime.of(8, 0));
        disponibilidade.setHoraFinal(LocalTime.of(12, 0));
    }

    @AfterEach
    void tearDown() {
        SecurityHolder.clear();
    }

    @Test
    void deveLancarExcecaoQuandoCadastrarDisponibilidadeEmBlocoJaOcupado() {
        // Arrange
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime horaInicial = LocalTime.of(8, 0);
        LocalTime horaFinal = LocalTime.of(12, 0);

        DisponibilidadeRequest request = new DisponibilidadeRequest(1L, dia, horaInicial, horaFinal, null, null);

        Disponibilidade novaDisponibilidade = new Disponibilidade();
        novaDisponibilidade.setProfissional(profissional);
        novaDisponibilidade.setDia(dia);
        novaDisponibilidade.setHoraInicial(horaInicial);
        novaDisponibilidade.setHoraFinal(horaFinal);

        // Mock do profissional service
        when(profissionalService.getById(1L)).thenReturn(profissional);

        // Mock do mapper
        when(disponibilidadeMapper.toEntity(request)).thenReturn(novaDisponibilidade);

        // Mock de conflito de horário - retorna uma lista com disponibilidade existente
        when(disponibilidadeRepository.findConflitosHorario(eq(1L), eq(dia), eq(horaInicial), eq(horaFinal), eq(1L)))
                .thenReturn(List.of(disponibilidade));

        // Act & Assert
        assertThrows(ConflitoBlocoHorarioException.class, () -> {
            disponibilidadeService.createDisponibilidade(request);
        });

        // Verifica que o save nunca foi chamado devido ao conflito
        verify(disponibilidadeRepository, never()).save(any());
    }

    @Test
    void deveLancarExcecaoQuandoCadastrarDisponibilidadeComSobreposicaoParcial() {
        // Arrange
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime horaInicial = LocalTime.of(10, 0);
        LocalTime horaFinal = LocalTime.of(14, 0);

        DisponibilidadeRequest request = new DisponibilidadeRequest(1L, dia, horaInicial, horaFinal, null, null);

        Disponibilidade novaDisponibilidade = new Disponibilidade();
        novaDisponibilidade.setProfissional(profissional);
        novaDisponibilidade.setDia(dia);
        novaDisponibilidade.setHoraInicial(horaInicial);
        novaDisponibilidade.setHoraFinal(horaFinal);

        // Mock do profissional service
        when(profissionalService.getById(1L)).thenReturn(profissional);

        // Mock do mapper
        when(disponibilidadeMapper.toEntity(request)).thenReturn(novaDisponibilidade);

        // Mock de conflito - existe disponibilidade das 8h às 12h que sobrepõe parcialmente
        when(disponibilidadeRepository.findConflitosHorario(eq(1L), eq(dia), eq(horaInicial), eq(horaFinal), eq(1L)))
                .thenReturn(List.of(disponibilidade));

        // Act & Assert
        assertThrows(ConflitoBlocoHorarioException.class, () -> {
            disponibilidadeService.createDisponibilidade(request);
        });

        verify(disponibilidadeRepository, never()).save(any());
    }

    @Test
    void devePermitirCadastrarDisponibilidadeEmBlocoDiferente() {
        // Arrange
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime horaInicial = LocalTime.of(14, 0);
        LocalTime horaFinal = LocalTime.of(18, 0);

        DisponibilidadeRequest request = new DisponibilidadeRequest(1L, dia, horaInicial, horaFinal, null, null);

        Disponibilidade novaDisponibilidade = new Disponibilidade();
        novaDisponibilidade.setProfissional(profissional);
        novaDisponibilidade.setDia(dia);
        novaDisponibilidade.setHoraInicial(horaInicial);
        novaDisponibilidade.setHoraFinal(horaFinal);

        Disponibilidade disponibilidadeSalva = new Disponibilidade();
        disponibilidadeSalva.setId(2L);
        disponibilidadeSalva.setProfissional(profissional);
        disponibilidadeSalva.setDia(dia);
        disponibilidadeSalva.setHoraInicial(horaInicial);
        disponibilidadeSalva.setHoraFinal(horaFinal);

        // Mock do profissional service
        when(profissionalService.getById(1L)).thenReturn(profissional);

        // Mock do mapper
        when(disponibilidadeMapper.toEntity(request)).thenReturn(novaDisponibilidade);

        // Mock sem conflito - retorna lista vazia (não há sobreposição)
        when(disponibilidadeRepository.findConflitosHorario(eq(1L), eq(dia), eq(horaInicial), eq(horaFinal), eq(1L)))
                .thenReturn(Collections.emptyList());

        // Mock do save
        when(disponibilidadeRepository.save(any(Disponibilidade.class))).thenReturn(disponibilidadeSalva);

        // Act
        Disponibilidade resultado = disponibilidadeService.createDisponibilidade(request);

        // Assert
        assertNotNull(resultado);
        assertEquals(2L, resultado.getId());
        verify(disponibilidadeRepository, times(1)).save(any(Disponibilidade.class));
    }

    @Test
    void devePermitirEditarDisponibilidadeSemAlterarHorario() {
        // Arrange
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime horaInicial = LocalTime.of(8, 0);
        LocalTime horaFinal = LocalTime.of(12, 0);

        DisponibilidadeRequest request = new DisponibilidadeRequest(1L, dia, horaInicial, horaFinal, null, null);

        Disponibilidade disponibilidadeExistente = new Disponibilidade();
        disponibilidadeExistente.setId(1L);
        disponibilidadeExistente.setProfissional(profissional);
        disponibilidadeExistente.setDia(dia);
        disponibilidadeExistente.setHoraInicial(horaInicial);
        disponibilidadeExistente.setHoraFinal(horaFinal);

        // Mock para getById (busca a disponibilidade existente)
        when(disponibilidadeRepository.findById(1L)).thenReturn(java.util.Optional.of(disponibilidadeExistente));

        // Mock do profissional service
        when(profissionalService.getById(1L)).thenReturn(profissional);

        // Mock do mapper para update
        when(disponibilidadeMapper.updateEntity(any(Disponibilidade.class), eq(request)))
                .thenReturn(disponibilidadeExistente);

        // Mock sem conflito - retorna lista vazia (a própria disponibilidade é excluída da busca)
        when(disponibilidadeRepository.findConflitosHorario(eq(1L), eq(dia), eq(horaInicial), eq(horaFinal), eq(1L)))
                .thenReturn(Collections.emptyList());

        // Mock do save
        when(disponibilidadeRepository.save(any(Disponibilidade.class))).thenReturn(disponibilidadeExistente);

        // Act & Assert
        assertDoesNotThrow(() -> {
            disponibilidadeService.editDisponibilidade(1L, request);
        });

        verify(disponibilidadeRepository, times(1)).save(any(Disponibilidade.class));
    }

    @Test
    void deveLancarExcecaoQuandoEditarDisponibilidadeParaHorarioConflitante() {
        // Arrange
        LocalDate dia = LocalDate.of(2025, 10, 20);

        // Disponibilidade existente que será editada
        Disponibilidade disponibilidade2 = new Disponibilidade();
        disponibilidade2.setId(2L);
        disponibilidade2.setProfissional(profissional);
        disponibilidade2.setDia(dia);
        disponibilidade2.setHoraInicial(LocalTime.of(14, 0));
        disponibilidade2.setHoraFinal(LocalTime.of(18, 0));

        // Nova tentativa de horário que conflita com disponibilidade1 (8h-12h)
        DisponibilidadeRequest requestEdicao = new DisponibilidadeRequest(
                1L,
                dia,
                LocalTime.of(10, 0), // Conflita com disponibilidade1 (8h-12h)
                LocalTime.of(16, 0),
                null,
                null
        );

        // Mock para getById (busca a disponibilidade2 que será editada)
        when(disponibilidadeRepository.findById(2L)).thenReturn(java.util.Optional.of(disponibilidade2));

        // Mock do profissional service
        when(profissionalService.getById(1L)).thenReturn(profissional);

        // Mock de conflito - disponibilidade1 (8h-12h) conflita com o novo horário (10h-16h)
        when(disponibilidadeRepository.findConflitosHorario(
                eq(1L),
                eq(dia),
                eq(LocalTime.of(10, 0)),
                eq(LocalTime.of(16, 0)),
                eq(1L)))
                .thenReturn(List.of(disponibilidade)); // disponibilidade1 das 8h-12h

        // Act & Assert
        assertThrows(ConflitoBlocoHorarioException.class, () -> {
            disponibilidadeService.editDisponibilidade(2L, requestEdicao);
        });

        verify(disponibilidadeRepository, never()).save(any());
    }

    @Test
    void deveRetornarDisponibilidadesPorData() {
        // Arrange
        Integer mes = 10;
        Integer ano = 2025;
        int page = 0;
        int size = 10;

        LocalDate startDate = LocalDate.of(2025, 10, 1).minusMonths(1);
        LocalDate endDate = LocalDate.of(2025, 10, 1).plusMonths(2).minusDays(1);

        org.springframework.data.domain.Page<Disponibilidade> mockPage =
            new org.springframework.data.domain.PageImpl<>(List.of(disponibilidade));

        // Mock do repository
        when(disponibilidadeRepository.findAllByDateRange(
                any(org.springframework.data.domain.Pageable.class),
                eq(startDate),
                eq(endDate),
                eq(1L)))
                .thenReturn(mockPage);

        // Act
        org.springframework.data.domain.Page<Disponibilidade> resultado =
            disponibilidadeService.getByDate(mes, ano, page, size);

        // Assert
        assertNotNull(resultado);
        assertEquals(1, resultado.getTotalElements());
        verify(disponibilidadeRepository, times(1)).findAllByDateRange(
            any(org.springframework.data.domain.Pageable.class),
            eq(startDate),
            eq(endDate),
            eq(1L));
    }

    @Test
    void deveUsarDataAtualQuandoMesEAnoForemNulos() {
        // Arrange
        int page = 0;
        int size = 10;

        LocalDate now = LocalDate.now();
        LocalDate startDate = LocalDate.of(now.getYear(), now.getMonthValue(), 1).minusMonths(1);
        LocalDate endDate = LocalDate.of(now.getYear(), now.getMonthValue(), 1).plusMonths(2).minusDays(1);

        org.springframework.data.domain.Page<Disponibilidade> mockPage =
            new org.springframework.data.domain.PageImpl<>(List.of());

        // Mock do repository
        when(disponibilidadeRepository.findAllByDateRange(
                any(org.springframework.data.domain.Pageable.class),
                eq(startDate),
                eq(endDate),
                eq(1L)))
                .thenReturn(mockPage);

        // Act
        org.springframework.data.domain.Page<Disponibilidade> resultado =
            disponibilidadeService.getByDate(null, null, page, size);

        // Assert
        assertNotNull(resultado);
        verify(disponibilidadeRepository, times(1)).findAllByDateRange(
            any(org.springframework.data.domain.Pageable.class),
            eq(startDate),
            eq(endDate),
            eq(1L));
    }

    @Test
    void deveEncontrarDisponibilidadePorProfissionalDiaEHora() {
        // Arrange
        Long profissionalId = 1L;
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime hora = LocalTime.of(9, 0);

        // Mock do repository
        when(disponibilidadeRepository.findByProfissionalAndDiaAndHora(
                eq(profissionalId),
                eq(dia),
                eq(hora),
                eq(1L)))
                .thenReturn(Optional.of(disponibilidade));

        // Act
        Optional<Disponibilidade> resultado =
            disponibilidadeService.findByProfissionalAndDiaAndHora(profissionalId, dia, hora);

        // Assert
        assertTrue(resultado.isPresent());
        assertEquals(disponibilidade.getId(), resultado.get().getId());
        verify(disponibilidadeRepository, times(1)).findByProfissionalAndDiaAndHora(
            eq(profissionalId),
            eq(dia),
            eq(hora),
            eq(1L));
    }

    @Test
    void deveRetornarVazioQuandoNaoEncontrarDisponibilidade() {
        // Arrange
        Long profissionalId = 1L;
        LocalDate dia = LocalDate.of(2025, 10, 20);
        LocalTime hora = LocalTime.of(15, 0);

        // Mock do repository
        when(disponibilidadeRepository.findByProfissionalAndDiaAndHora(
                eq(profissionalId),
                eq(dia),
                eq(hora),
                eq(1L)))
                .thenReturn(Optional.empty());

        // Act
        Optional<Disponibilidade> resultado =
            disponibilidadeService.findByProfissionalAndDiaAndHora(profissionalId, dia, hora);

        // Assert
        assertFalse(resultado.isPresent());
        verify(disponibilidadeRepository, times(1)).findByProfissionalAndDiaAndHora(
            eq(profissionalId),
            eq(dia),
            eq(hora),
            eq(1L));
    }
}
