package br.com.nemeia.brigia.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ContaReceberItemResponse {
    private Long id;
    private ProcedimentoResponse procedimento;
    private Integer quantidade;
    private ConvenioResponse convenio;
    private BigDecimal valor;
}
