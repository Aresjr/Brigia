import { Component, OnInit } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoNovoComponent } from './agendamento-novo.component';
import { Agendamento, AgendamentoRequest, EventoFactory } from './agendamento.interface';
import { CalendarioComponent } from '../shared/calendario/calendario.component';
import { CalendarEvent } from 'angular-calendar';
import { ActivatedRoute } from '@angular/router';
import { AgendamentosService } from './agendamentos.service';
import { ToastrService } from 'ngx-toastr';

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
  eventos: CalendarEvent<Agendamento>[] = [];
  exibeNovoAgendamento: boolean = false;

  constructor(private route: ActivatedRoute, private toastr: ToastrService,
              private agendamentoService: AgendamentosService) {
    this.route.queryParams.subscribe(params => {
      if (params['pacienteId']) {
        console.log('pacienteId', params['pacienteId']);
      }
    });
  }

  ngOnInit(): void {
    this.carregarAgendamentos();
  }

  carregarAgendamentos() {
    this.agendamentoService.listar().subscribe({
      next: value => {
        const agendamentos = value.items;
        console.log(agendamentos);
        this.eventos = agendamentos.map(a => EventoFactory.fromApi(a));
        console.log(this.eventos);
      }
    });
  }

  onAddNovo() {
    this.exibeNovoAgendamento = true;
  }

  fecharNovoAgendamento() {
    this.exibeNovoAgendamento = false;
  }

  agendar(agendamento: Partial<AgendamentoRequest>) {
    this.agendamentoService.criar(agendamento).subscribe({
      next: () => {
        this.toastr.success(`Agendamento realizado`);
        this.carregarAgendamentos();
        this.fecharNovoAgendamento();
      }
    });
  }
}
