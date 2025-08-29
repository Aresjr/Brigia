import { Entidade, EntidadeRequest, EntidadeResponse } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { formatHora } from '../../core/util-methods';
import { CalendarEvent } from 'angular-calendar';

export interface Agendamento extends Entidade {
    descricao: string | null;
    data: string;
    hora: string;
    duracao: number;
    paciente: Paciente;
    profissional: Profissional;
    especialidade: Especialidade;
}

export interface AgendamentoRequest extends EntidadeRequest {
    pacienteId: number;
    data: Date;
    hora: string;
    profissionalId: number;
    especialidadeId: number | null;
    procedimentoId: number | null;
    convenioId: number | null;
    empresaId: number | null;
    duracao: number | null;
    formaPagamento: number | null;
    valor: string | null;
    desconto: number | null;
    observacoes: string | null;
}

export interface AgendamentoResponse extends EntidadeResponse {
    items: Agendamento[];
}

export class EventoFactory {
  static fromApi(agendamento: Agendamento): CalendarEvent {
    const [h, m] = agendamento.hora.split(':').map(Number);
    const [ano, mes, diaNum] = agendamento.data.split('-').map(Number);
    const start = new Date(ano, mes - 1, diaNum);
    start.setHours(h, m, 0, 0);
    console.log('start', start);
    const end = new Date(start.getTime() + agendamento.duracao * 60000);

    return {
      start: start,
      end: end,
      title: `${agendamento.paciente.nome} | ${formatHora(start)}-${formatHora(end)}<br/>${agendamento.profissional.nome} | ${agendamento.especialidade.nome}`,
      color: { primary: '#1e90ff', secondary: '#D1E8FF' },
      meta: agendamento
    };
  }
}
