package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusContaReceber;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContaReceberResponse {
    private Long id;
    private PacienteResponse paciente;
    private EmpresaResponse empresa;
    private ProfissionalResponse profissional;
    private LocalDate dataAtendimento;
    private BigDecimal valorAgendamento;
    private BigDecimal valorDesconto;
    private BigDecimal valorProcedimentosLancados;
    private BigDecimal valorTotal;
    private BigDecimal valorRecebido;
    private String convenio;
    private FormaPagamento formaPagamento;
    private StatusContaReceber status;
}
