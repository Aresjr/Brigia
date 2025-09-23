import { CalendarEvent } from 'angular-calendar';
import { Agendamento } from '../features/agenda-diaria/agendamento.interface';
import { StatusAgendamento } from './constans';

export class EventoFactory {
  static fromApi(agendamento: Agendamento): CalendarEvent {
    const data: DataAgendamento = this.getDataAgendamento(agendamento);

    return {
      start: data.start,
      end: data.end,
      title: `${agendamento.paciente.nome} - ${StatusAgendamento[agendamento.status].descricao.toUpperCase()}
      <br/>
      ${agendamento.hora} - ${agendamento.horaFim}
      <br/>
      ${agendamento.profissional.nome}`,
      color: { primary: StatusAgendamento[agendamento.status].cor, secondary: StatusAgendamento[agendamento.status].cor },
      meta: agendamento
    };
  }

  private static getDataAgendamento(agendamento: Agendamento): DataAgendamento {
    const [h, m] = agendamento.hora.split(':').map(Number);
    const [ano, mes, diaNum] = agendamento.data.split('-').map(Number);
    const start = new Date(ano, mes - 1, diaNum);
    start.setHours(h, m, 0, 0);
    const end = new Date(start.getTime() + agendamento.duracao * 60000);
    return { start, end };
  }

}

interface DataAgendamento {
  start: Date;
  end: Date;
}
