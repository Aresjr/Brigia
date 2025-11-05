package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.FormaPagamento;
import br.com.nemeia.brigia.model.TipoAgendamento;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record FilaEsperaRequest(@NotNull(message = "Paciente é obrigatório") Long pacienteId,
        @NotNull(message = "Especialidade é obrigatória") Long especialidadeId, String observacoes,
        // Campos opcionais para facilitar conversão para agendamento
        Long convenioId, Long empresaId, Long profissionalId, Long procedimentoId, TipoAgendamento tipoAgendamento,
        FormaPagamento formaPagamento, BigDecimal valor, BigDecimal desconto, Integer duracao) {
}
