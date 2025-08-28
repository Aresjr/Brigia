import { Component, OnInit } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoNovoComponent } from './agendamento-novo.component';
import { AgendamentoRequest } from './agendamento.interface';
import { CalendarioComponent } from '../shared/calendario/calendario.component';
import { CalendarEvent } from 'angular-calendar';

@Component({
  selector: 'app-agenda-diaria',
  imports: [
    TopBarComponent,
    AgendamentoNovoComponent,
    CalendarioComponent
  ],
  templateUrl: './agenda-diaria.component.html'
})
export class AgendaDiariaComponent implements OnInit {
  events: CalendarEvent[] = [];
  exibeNovoAgendamento: boolean = false;

  ngOnInit(): void {
    let startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 11);
    let endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 13);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'}
      }
    );

    startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12);
    endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 30);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'}
      }
    );

    startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12);
    endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 45);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'}
      }
    );
  }

  onAddNovo() {
    this.exibeNovoAgendamento = true;
  }

  fecharNovoAgendamento() {
    this.exibeNovoAgendamento = false;
  }

  agendar(agendamento: Partial<AgendamentoRequest>) {
    console.log(agendamento);
  }
}
