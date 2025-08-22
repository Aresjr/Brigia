import { Component } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoNovoComponent } from './agendamento-novo.component';

@Component({
  selector: 'app-agendamentos',
  imports: [
    TopBarComponent,
    AgendamentoNovoComponent
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

  agendar() {
    console.log('Agendado!');
  }
}
