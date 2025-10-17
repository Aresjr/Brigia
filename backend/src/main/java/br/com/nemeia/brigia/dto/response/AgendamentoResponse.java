package br.com.nemeia.brigia.dto.response;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.StatusAgendamento;
import br.com.nemeia.brigia.model.TipoAgendamento;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public record AgendamentoResponse(Long id, PacienteResponse paciente,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") LocalDate data,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime hora,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm") LocalTime horaFim, UnidadeResponse unidade,
        EspecialidadeResponse especialidade, EmpresaResponse empresa, ConvenioResponse convenio,
        ProfissionalResponse profissional, ProcedimentoResponse procedimento, StatusAgendamento status,
        TipoAgendamento tipoAgendamento, FormaPagamento formaPagamento, BigDecimal valor, BigDecimal desconto,
        String observacoes, Integer duracao, Boolean encaixe, Boolean pago,
        List<ProcedimentoAgendamentoResponse> procedimentos, BigDecimal valorTotal,
        LocalDateTime criadoEm, Boolean excluido) {
}
