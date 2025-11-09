package br.com.nemeia.brigia.dto.request;

import br.com.nemeia.brigia.model.TipoAgendamento;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;

public record ProcedimentoRequest(@NotBlank(message = "Nome é obrigatório") String nome, String codigo,
        String observacoes, Integer duracao, TipoAgendamento tipo,
        @NotNull(message = "Especialidade é obrigatória") Long especialidadeId,
        List<PrecoProcedimentoRequest> precosConvenios, List<PrecoProcedimentoPlanoRequest> precosPlanos) {
}
