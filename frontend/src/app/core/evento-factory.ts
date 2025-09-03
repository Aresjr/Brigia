import { CalendarEvent } from 'angular-calendar';
import { formatHora } from './util-methods';
import { Agendamento } from '../features/agenda-diaria/agendamento.interface';

export const TAILWIND_BLUE = {
  100: 'rgb(219, 234, 254)',
  200: 'rgb(191, 219, 254)',
  300: 'rgb(147, 197, 253)',
  400: 'rgb(96, 165, 250)',
  500: 'rgb(59, 130, 246)',
  600: 'rgb(37, 99, 235)',
  700: 'rgb(29, 78, 216)',
  800: 'rgb(30, 64, 175)',
  900: 'rgb(30, 58, 138)',
};

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
      color: { primary: TAILWIND_BLUE[400], secondary: TAILWIND_BLUE[400] },
      meta: agendamento
    };
  }
}
