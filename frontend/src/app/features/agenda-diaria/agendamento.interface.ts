import { Entidade, EntidadeRequest, EntidadeResponse } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { formatHora } from '../../core/util-methods';
import { CalendarEvent } from 'angular-calendar';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';

export interface Agendamento extends Entidade {
    descricao: string | null;
    data: string;
    hora: string;
    duracao: number;
    paciente: Paciente;
    profissional: Profissional;
    especialidade: Especialidade;
    procedimento: Procedimento;
    convenio?: Convenio;
    empresa?: Empresa;
    formaPagamento: number;
    status: number;
    observacoes?: string;
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

export class EventoFactory {
  static fromApi(agendamento: Agendamento): CalendarEvent {
    const [h, m] = agendamento.hora.split(':').map(Number);
    const [ano, mes, diaNum] = agendamento.data.split('-').map(Number);
    const start = new Date(ano, mes - 1, diaNum);
    start.setHours(h, m, 0, 0);
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
