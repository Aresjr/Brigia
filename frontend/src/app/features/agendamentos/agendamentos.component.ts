import { Component } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoNovoComponent } from './agendamento-novo.component';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { CalendarioComponent } from '../shared/calendario/calendario.component';

@Component({
  selector: 'app-agendamentos',
  imports: [
    TopBarComponent,
    AgendamentoNovoComponent,
    CalendarioComponent
  ],
  templateUrl: './agendamentos.component.html'
})
export class AgendamentosComponent {
  exibeNovoAgendamento: boolean = false;

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
