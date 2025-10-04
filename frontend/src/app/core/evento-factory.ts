import { CalendarEvent } from 'angular-calendar';
import { Agendamento } from '../features/agenda-diaria/agendamento.interface';
import { Disponibilidade } from '../features/disponibilidade/disponibilidade.interface';
import { StatusAgendamento } from './constans';

export class EventoFactory {
  static fromAgendamento(agendamento: Agendamento): CalendarEvent {
    const data: DataAgendamento = this.getDataAgendamento(agendamento);

    return {
      start: data.start,
      end: data.end,
      title: `${agendamento.paciente.nome} - ${StatusAgendamento[agendamento.status].descricao.toUpperCase()}
      <br/>
      ${agendamento.encaixe ? 'ENCAIXE' : null} ${agendamento.hora} - ${agendamento.horaFim}
      <br/>
      ${agendamento.profissional.nome}`,
      color: { primary: StatusAgendamento[agendamento.status].cor, secondary: StatusAgendamento[agendamento.status].cor },
      meta: agendamento
    };
  }

  static fromDisponibilidade(disponibilidade: Disponibilidade): CalendarEvent {
    const data: DataAgendamento = this.getDataDisponibilidade(disponibilidade);

    return {
      start: data.start,
      end: data.end,
      title: `${disponibilidade.profissional.nome}
      <br/>
      ${disponibilidade.horaInicial} - ${disponibilidade.horaFinal}
      <br/>
      DISPONÍVEL
      `,
      color: { primary: '#10b981', secondary: '#10b981' },
      meta: disponibilidade
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

  private static getDataDisponibilidade(disponibilidade: Disponibilidade): DataAgendamento {
    const [hInicial, mInicial] = disponibilidade.horaInicial.split(':').map(Number);
    const [hFinal, mFinal] = disponibilidade.horaFinal.split(':').map(Number);
    const [ano, mes, diaNum] = disponibilidade.dia.split('-').map(Number);

    const start = new Date(ano, mes - 1, diaNum);
    start.setHours(hInicial, mInicial, 0, 0);

    const end = new Date(ano, mes - 1, diaNum);
    end.setHours(hFinal, mFinal, 0, 0);

    return { start, end };
  }

}

interface DataAgendamento {
  start: Date;
  end: Date;
}
