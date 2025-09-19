package br.com.nemeia.brigia.mapper;

import br.com.nemeia.brigia.dto.request.AtendimentoRequest;
import br.com.nemeia.brigia.dto.response.AtendimentoResponse;
import br.com.nemeia.brigia.dto.response.PagedResponse;
import br.com.nemeia.brigia.model.Atendimento;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class AtendimentoMapper {

    private final ObjectMapper objectMapper;
    private final PacienteMapper pacienteMapper;
    private final ProfissionalMapper profissionalMapper;
    private final AgendamentoMapper agendamentoMapper;
    private final ConvenioMapper convenioMapper;
    private final EmpresaMapper empresaMapper;
    private final EspecialidadeMapper especialidadeMapper;

    public AtendimentoResponse toResponse(Atendimento atendimento) {
        if (atendimento == null) {
            return null;
        }

        return new AtendimentoResponse(atendimento.getId(), pacienteMapper.toResponse(atendimento.getPaciente()),
                profissionalMapper.toResponse(atendimento.getProfissional()), atendimento.getData(),
                atendimento.getHoraInicio(), atendimento.getHoraFim(),
                agendamentoMapper.toResponse(atendimento.getAgendamento()),
                convenioMapper.toResponse(atendimento.getConvenio()), atendimento.getStatus(),
                empresaMapper.toResponse(atendimento.getEmpresa()),
                especialidadeMapper.toResponse(atendimento.getEspecialidade()), atendimento.getFormaPagamento(),
                atendimento.getObservacoes(), atendimento.getAnamnese(), atendimento.getExameFisico(),
                atendimento.getDiagnostico(), atendimento.getEvolucaoClinica(), atendimento.getExamesSolicitados(),
                atendimento.getPrescricoes());
    }

    public PagedResponse<AtendimentoResponse> toPagedResponse(Page<Atendimento> paged) {
        List<AtendimentoResponse> responses = paged.getContent().stream().map(this::toResponse).toList();
        return new PagedResponse<>(responses, paged.getNumber(), paged.getTotalPages(), paged.getTotalElements());
    }

    public Atendimento toEntity(AtendimentoRequest request) {
        if (request == null) {
            return null;
        }
        return objectMapper.convertValue(request, Atendimento.class);
    }
}
