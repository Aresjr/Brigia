package br.com.nemeia.brigia.mapper;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import br.com.nemeia.brigia.dto.response.ContaReceberResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

@ExtendWith(MockitoExtension.class)
@DisplayName("ContaReceberMapper - Testes de Componente")
class ContaReceberMapperTest {

    @Mock
    private ObjectMapper objectMapper;

    @Mock
    private PacienteMapper pacienteMapper;

    @Mock
    private EmpresaMapper empresaMapper;

    @Mock
    private ProfissionalMapper profissionalMapper;

    @InjectMocks
    private ContaReceberMapper contaReceberMapper;

    private ContaReceber contaReceber1;
    private ContaReceber contaReceber2;

    @BeforeEach
    void setUp() {
        // Setup ContaReceber 1
        contaReceber1 = new ContaReceber();
        contaReceber1.setId(1L);
        contaReceber1.setValorAgendamento(new BigDecimal("100.00"));
        contaReceber1.setValorDesconto(new BigDecimal("10.00"));
        contaReceber1.setValorTotalLancado(new BigDecimal("50.00"));
        contaReceber1.setValorRecebido(new BigDecimal("50.00"));
        contaReceber1.setFormaPagamento(FormaPagamento.DINHEIRO);
        contaReceber1.setStatus(StatusContaReceber.PARCIAL);

        Paciente paciente1 = new Paciente();
        paciente1.setId(1L);
        paciente1.setNome("João Silva");
        contaReceber1.setPaciente(paciente1);

        Empresa empresa1 = new Empresa();
        empresa1.setId(1L);
        empresa1.setNome("Empresa A");
        contaReceber1.setEmpresa(empresa1);

        Profissional profissional1 = new Profissional();
        profissional1.setId(1L);
        profissional1.setNome("Dr. Carlos");
        contaReceber1.setProfissional(profissional1);

        Atendimento atendimento1 = new Atendimento();
        atendimento1.setId(1L);
        atendimento1.setData(LocalDate.of(2025, 10, 15));
        Convenio convenio1 = new Convenio();
        convenio1.setNome("Convênio X");
        atendimento1.setConvenio(convenio1);
        contaReceber1.setAtendimento(atendimento1);

        // Setup ContaReceber 2
        contaReceber2 = new ContaReceber();
        contaReceber2.setId(2L);
        contaReceber2.setValorAgendamento(new BigDecimal("200.00"));
        contaReceber2.setValorDesconto(new BigDecimal("0.00"));
        contaReceber2.setValorTotalLancado(new BigDecimal("0.00"));
        contaReceber2.setValorRecebido(new BigDecimal("200.00"));
        contaReceber2.setFormaPagamento(FormaPagamento.CARTAO_CREDITO);
        contaReceber2.setStatus(StatusContaReceber.PAGO);

        Paciente paciente2 = new Paciente();
        paciente2.setId(2L);
        paciente2.setNome("Maria Santos");
        contaReceber2.setPaciente(paciente2);

        Empresa empresa2 = new Empresa();
        empresa2.setId(2L);
        empresa2.setNome("Empresa B");
        contaReceber2.setEmpresa(empresa2);

        Profissional profissional2 = new Profissional();
        profissional2.setId(2L);
        profissional2.setNome("Dra. Ana");
        contaReceber2.setProfissional(profissional2);

        Atendimento atendimento2 = new Atendimento();
        atendimento2.setId(2L);
        atendimento2.setData(LocalDate.of(2025, 10, 16));
        atendimento2.setConvenio(null);
        contaReceber2.setAtendimento(atendimento2);
    }

    @Test
    @DisplayName("Deve converter Page<ContaReceber> para PagedResponse sem lançar exceção de stream")
    void testToPagedResponse_ShouldNotThrowStreamException() {
        // Arrange
        List<ContaReceber> content = Arrays.asList(contaReceber1, contaReceber2);
        Page<ContaReceber> page = new PageImpl<>(content, PageRequest.of(0, 20), 2);

        // Mock dos mappers aninhados para retornar null (comportamento padrão seguro)
        when(pacienteMapper.toResponse(any(Paciente.class))).thenReturn(null);
        when(empresaMapper.toResponse(any(Empresa.class))).thenReturn(null);
        when(profissionalMapper.toResponse(any(Profissional.class))).thenReturn(null);

        // Act & Assert - não deve lançar IllegalStateException: stream has already been operated upon or
        // closed
        assertDoesNotThrow(() -> {
            PagedResponse<ContaReceberResponse> response = contaReceberMapper.toPagedResponse(page);

            // Validações básicas
            assertNotNull(response);
            assertEquals(2, response.items().size());
            assertEquals(0, response.currentPage());
            assertEquals(1, response.totalPages());
            assertEquals(2, response.totalRecords());
        });

        // Verifica que o método toResponse foi chamado para cada item da página
        verify(pacienteMapper, times(2)).toResponse(any(Paciente.class));
        verify(empresaMapper, times(2)).toResponse(any(Empresa.class));
        verify(profissionalMapper, times(2)).toResponse(any(Profissional.class));
    }

    @Test
    @DisplayName("Deve converter ContaReceber individual corretamente")
    void testToResponse_ShouldConvertCorrectly() {
        // Arrange
        when(pacienteMapper.toResponse(any(Paciente.class))).thenReturn(null);
        when(empresaMapper.toResponse(any(Empresa.class))).thenReturn(null);
        when(profissionalMapper.toResponse(any(Profissional.class))).thenReturn(null);

        // Act
        ContaReceberResponse response = contaReceberMapper.toResponse(contaReceber1);

        // Assert
        assertNotNull(response);
        assertEquals(1L, response.getId());
        assertEquals(new BigDecimal("100.00"), response.getValorAgendamento());
        assertEquals(new BigDecimal("10.00"), response.getValorDesconto());
        assertEquals(new BigDecimal("50.00"), response.getValorProcedimentosLancados());
        assertEquals(new BigDecimal("140.00"), response.getValorTotal()); // 100 + 50 - 10
        assertEquals(new BigDecimal("50.00"), response.getValorRecebido());
        assertEquals("Convênio X", response.getConvenio());
        assertEquals(FormaPagamento.DINHEIRO, response.getFormaPagamento());
        assertEquals(StatusContaReceber.PARCIAL, response.getStatus());
        assertEquals(false, response.getFaturado());
    }

    @Test
    @DisplayName("Deve retornar null quando ContaReceber for null")
    void testToResponse_WithNullContaReceber_ShouldReturnNull() {
        // Act
        ContaReceberResponse response = contaReceberMapper.toResponse(null);

        // Assert
        assertNull(response);
    }

    @Test
    @DisplayName("Deve converter Agendamento para ContaReceber corretamente")
    void testFromAgendamento_ShouldConvertCorrectly() {
        // Arrange
        Agendamento agendamento = new Agendamento();
        agendamento.setId(1L);
        agendamento.setValor(new BigDecimal("150.00"));
        agendamento.setDesconto(new BigDecimal("15.00"));
        agendamento.setFormaPagamento(FormaPagamento.PIX);
        agendamento.setPago(false);

        Paciente paciente = new Paciente();
        paciente.setId(1L);
        agendamento.setPaciente(paciente);

        Empresa empresa = new Empresa();
        empresa.setId(1L);
        agendamento.setEmpresa(empresa);

        Profissional profissional = new Profissional();
        profissional.setId(1L);
        agendamento.setProfissional(profissional);

        // Act
        ContaReceber contaReceber = contaReceberMapper.fromAgendamento(agendamento);

        // Assert
        assertNotNull(contaReceber);
        assertEquals(paciente, contaReceber.getPaciente());
        assertEquals(empresa, contaReceber.getEmpresa());
        assertEquals(profissional, contaReceber.getProfissional());
        assertEquals(new BigDecimal("150.00"), contaReceber.getValorAgendamento());
        assertEquals(new BigDecimal("15.00"), contaReceber.getValorDesconto());
        assertEquals(BigDecimal.ZERO, contaReceber.getValorTotalLancado());
        assertEquals(FormaPagamento.PIX, contaReceber.getFormaPagamento());
        assertEquals(StatusContaReceber.ABERTO, contaReceber.getStatus());
        assertEquals(BigDecimal.ZERO, contaReceber.getValorRecebido());
        assertNull(contaReceber.getAtendimento());
    }

    @Test
    @DisplayName("Deve converter Agendamento pago para ContaReceber com status PAGO")
    void testFromAgendamento_WhenPago_ShouldSetStatusPago() {
        // Arrange
        Agendamento agendamento = new Agendamento();
        agendamento.setValor(new BigDecimal("100.00"));
        agendamento.setDesconto(new BigDecimal("10.00"));
        agendamento.setFormaPagamento(FormaPagamento.DINHEIRO);
        agendamento.setPago(true);

        Paciente paciente = new Paciente();
        agendamento.setPaciente(paciente);

        Profissional profissional = new Profissional();
        agendamento.setProfissional(profissional);

        // Act
        ContaReceber contaReceber = contaReceberMapper.fromAgendamento(agendamento);

        // Assert
        assertEquals(StatusContaReceber.PAGO, contaReceber.getStatus());
        assertEquals(new BigDecimal("90.00"), contaReceber.getValorRecebido()); // 100 - 10
    }

    @Test
    @DisplayName("Deve processar múltiplas páginas sem erro de stream")
    void testToPagedResponse_MultiplePages_ShouldNotThrowException() {
        // Arrange - Simula múltiplas chamadas como se estivesse paginando
        List<ContaReceber> page1Content = Arrays.asList(contaReceber1);
        List<ContaReceber> page2Content = Arrays.asList(contaReceber2);

        Page<ContaReceber> page1 = new PageImpl<>(page1Content, PageRequest.of(0, 1), 2);
        Page<ContaReceber> page2 = new PageImpl<>(page2Content, PageRequest.of(1, 1), 2);

        when(pacienteMapper.toResponse(any(Paciente.class))).thenReturn(null);
        when(empresaMapper.toResponse(any(Empresa.class))).thenReturn(null);
        when(profissionalMapper.toResponse(any(Profissional.class))).thenReturn(null);

        // Act & Assert
        assertDoesNotThrow(() -> {
            PagedResponse<ContaReceberResponse> response1 = contaReceberMapper.toPagedResponse(page1);
            PagedResponse<ContaReceberResponse> response2 = contaReceberMapper.toPagedResponse(page2);

            assertEquals(1, response1.items().size());
            assertEquals(1, response2.items().size());
            assertEquals(0, response1.currentPage());
            assertEquals(1, response2.currentPage());
        });
    }
}
