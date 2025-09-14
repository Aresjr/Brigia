import { CalendarEvent } from 'angular-calendar';
import { formatHora } from './util-methods';
import { Agendamento } from '../features/agenda-diaria/agendamento.interface';
import { StatusAgendamento, StatusDescricao } from './constans';

export const CorAtendimento: Record<number, string> = {
  [StatusAgendamento.Agendado]: '#60a5fa',
  [StatusAgendamento.Confirmado]: '#2563EB',
  [StatusAgendamento.EmAtendimento]: '#06B6D4',
  [StatusAgendamento.Cancelado]: '#EF4444',
  [StatusAgendamento.NaoCompareceu]: '#F59E0B',
  [StatusAgendamento.Reagendado]: '#F59E0B',
  [StatusAgendamento.Finalizado]: '#14B8A6'
};

//Disponibilidade do médico - #D1FAE5

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
      title: `${agendamento.paciente.nome} - ${StatusDescricao[agendamento.status].toUpperCase()}
      <br/>
      ${formatHora(start)}-${formatHora(end)} - ${agendamento.profissional.nome}`,
      color: { primary: CorAtendimento[agendamento.status], secondary: CorAtendimento[agendamento.status] },
      meta: agendamento
    };
  }
}
