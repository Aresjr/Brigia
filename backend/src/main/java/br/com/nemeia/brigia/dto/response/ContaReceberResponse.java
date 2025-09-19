package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusContaReceber;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContaReceberResponse {
    private Long id;
    private PacienteResponse paciente;
    private EmpresaResponse empresa;
    private AtendimentoResponse atendimento;
    private ProfissionalResponse profissional;
    private BigDecimal valorTotal;
    private BigDecimal valorRecebido;
    private FormaPagamento formaPagamento;
    private StatusContaReceber status;
    private List<ContaReceberItemResponse> itens;
}
