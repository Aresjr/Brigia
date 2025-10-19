import { CalendarEvent } from 'angular-calendar';
import { Agendamento, StatusAgendamento } from '../features/agenda-diaria/agendamento.interface';
import { Disponibilidade } from '../features/disponibilidade/disponibilidade.interface';
import { AgendaSemanal } from '../features/agenda-semanal/agenda-semanal.interface';

export class EventoFactory {
  static fromAgendamento(agendamento: Agendamento): CalendarEvent {
    const data: DataAgendamento = this.getDataAgendamento(agendamento);

    return {
      start: data.start,
      end: data.end,
      title: `${agendamento.paciente.nome}
      <br/>
      ${agendamento.encaixe ? 'ENCAIXE' : ''} ${agendamento.hora} - ${agendamento.horaFim}
      <br/>
      ${StatusAgendamento[agendamento.status].descricao.toUpperCase()}
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
      color: { primary: '#A78BFA', secondary: '#A78BFA' },
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

  /**
   * Converte um registro de AgendaSemanal em eventos do calendário para um período específico
   * @param agendaSemanal - Registro da agenda semanal
   * @param dataInicio - Data inicial do período
   * @param dataFim - Data final do período
   * @returns Array de eventos do calendário para cada ocorrência no período
   */
  static fromAgendaSemanal(agendaSemanal: AgendaSemanal, dataInicio: Date, dataFim: Date): CalendarEvent[] {
    const eventos: CalendarEvent[] = [];
    const dataAtual = new Date(dataInicio);

    // Iterar por cada dia no período
    while (dataAtual <= dataFim) {
      // Verificar se o dia da semana corresponde ao dia da agenda semanal
      if (dataAtual.getDay() === agendaSemanal.diaSemana) {
        const [hInicial, mInicial] = agendaSemanal.horaInicial.split(':').map(Number);
        const [hFinal, mFinal] = agendaSemanal.horaFinal.split(':').map(Number);

        const start = new Date(dataAtual);
        start.setHours(hInicial, mInicial, 0, 0);

        const end = new Date(dataAtual);
        end.setHours(hFinal, mFinal, 0, 0);

        eventos.push({
          start: start,
          end: end,
          title: `${agendaSemanal.profissional.nome}
          <br/>
          ${agendaSemanal.horaInicial} - ${agendaSemanal.horaFinal}
          <br/>
          DISPONÍVEL (SEMANAL)
          `,
          color: { primary: '#10b981', secondary: '#10b981' },
          meta: {
            ...agendaSemanal,
            dia: dataAtual.toISOString().split('T')[0] // Adicionar data específica ao meta
          }
        });
      }

      // Avançar para o próximo dia
      dataAtual.setDate(dataAtual.getDate() + 1);
    }

    return eventos;
  }

}

interface DataAgendamento {
  start: Date;
  end: Date;
}
