package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.TipoAgendamento;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record FilaEsperaResponse(
        Long id,
        PacienteResponse paciente,
        EspecialidadeResponse especialidade,
        String observacoes,
        // Campos opcionais para facilitar conversão para agendamento
        ConvenioResponse convenio,
        EmpresaResponse empresa,
        ProfissionalResponse profissional,
        ProcedimentoResponse procedimento,
        TipoAgendamento tipoAgendamento,
        FormaPagamento formaPagamento,
        BigDecimal valor,
        BigDecimal desconto,
        Integer duracao,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm") LocalDateTime criadoEm,
        Boolean excluido
) {
}
