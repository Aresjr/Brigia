import { Component, OnInit } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoFormComponent } from './agendamento-form.component';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { CalendarioComponent } from '../shared/calendario/calendario.component';
import { CalendarEvent } from 'angular-calendar';
import { NavigationEnd, Router } from '@angular/router';
import { AgendamentosService } from './agendamentos.service';
import { ToastrService } from 'ngx-toastr';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionaisService } from '../profissionais/profissionais.service';
import { EventoFactory } from '../../core/evento-factory';
import { UserService } from '../../core/user.service';
import { LucideAngularModule } from 'lucide-angular';
import { FabComponent } from '../shared/fab/fab.component';
import { filter } from 'rxjs/operators';
import { NgIf } from '@angular/common';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';

@Component({
  selector: 'app-agenda-diaria',
  imports: [
    TopBarComponent,
    AgendamentoFormComponent,
    CalendarioComponent,
    LucideAngularModule,
    FabComponent,
    NgIf,
    NgNotFoundTemplateDirective,
    NgOptionComponent,
    NgSelectComponent
  ],
  templateUrl: './agenda-diaria.component.html'
})
export class AgendaDiariaComponent implements OnInit {
  agendamentoDetalhes: Agendamento | null = null;
  dataAgendamento: Date | null = null;
  eventosExibicao: CalendarEvent<Agendamento>[] = [];
  eventosInternos: CalendarEvent<Agendamento>[] = [];
  profissionais: Profissional[] = [];
  exibeForm: boolean = false;
  pacienteId: number | null = null;
  isLoading: boolean = false;
  dataExibicao: Date = new Date();
  profissionalFiltro: number = 0;

  constructor(private router: Router, private toastr: ToastrService,
              private agendamentoService: AgendamentosService,
              private profissionaisService: ProfissionaisService,
              protected userService: UserService) {
    const navigation = this.router.getCurrentNavigation();
    const pacienteId = navigation?.extras.state?.['pacienteId'];
    this.pacienteId = pacienteId ? pacienteId : null;
  }

  ngOnInit(): void {
    this.carregarAgendamentos();

    if (!this.userService.isMedico()) {
      this.carregarProfissionais();
    }

    if (this.pacienteId) {
      this.onAddNovo();
    }

    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: NavigationEnd) => {
        if (event.urlAfterRedirects === '/agenda-diaria') {
          this.carregarAgendamentos();
        }
      });
  }

  carregarAgendamentos() {
    this.isLoading = true;

    const ano = this.dataExibicao.getFullYear();
    const mes = this.dataExibicao.getMonth() + 1;

    this.agendamentoService.listarPorData(ano, mes).subscribe({
      next: value => {
        const agendamentos = value.items;
        this.eventosInternos = agendamentos.map(a => EventoFactory.fromApi(a));
        //this.eventosInternos = [...this.eventosExibicao];

        this.filtrarProfissional();

        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  carregarProfissionais() {
    this.profissionaisService.listar().subscribe({
      next: value => {
        this.profissionais = value.items;
      }
    });
  }

  onAddNovo() {
    this.dataAgendamento = null;
    this.agendamentoDetalhes = null;
    this.exibeForm = true;
  }

  fecharForm() {
    this.agendamentoDetalhes = null;
    this.exibeForm = false;
  }

  salvar(agendamento: Partial<AgendamentoRequest>) {
    if (this.agendamentoDetalhes) {
      this.agendamentoService.atualizar(this.agendamentoDetalhes.id, agendamento).subscribe({
        next: () => {
          this.toastr.success('Agendamento atualizado');
          this.carregarAgendamentos();
          this.exibeForm = false;
          this.agendamentoDetalhes = null;
        }
      });
    } else {
      this.agendamentoService.criar(agendamento).subscribe({
        next: () => {
          this.toastr.success(`Agendamento realizado`);
          this.carregarAgendamentos();
          this.fecharForm();
        }
      });
    }
  }

  detalhesAgendamento(agendamento: Agendamento) {
    this.agendamentoDetalhes = agendamento;
    this.exibeForm = true;
  }

  diaClicado(data: Date) {
    console.log('diaClicado', data);
  }

  horarioClicado(data: Date) {
    if (this.userService.isMedico()) {
      return;
    }

    if (data.getTime() > new Date().getTime()) {
      this.dataAgendamento = data;
      this.exibeForm = true;
    } else {
      this.toastr.warning('Para abrir um agendamento, selecione um horário futuro.');
    }
  }

  onSearch($event: any): void {
    const searchTerm = $event.toLowerCase(); //TODO - implementar
    console.log(searchTerm);
  }

  selectProfissional(profissionalId: number) {
    this.profissionalFiltro = profissionalId;
    this.filtrarProfissional();
  }

  filtrarProfissional() {
    if (this.profissionalFiltro && this.profissionalFiltro != 0) {
      this.eventosExibicao = this.eventosInternos.filter(item => item.meta?.profissional.id == this.profissionalFiltro);
    } else {
      this.eventosExibicao = [...this.eventosInternos];
    }
  }

  mostraFab() {
    return !this.userService.isMedico();
  }

  dataAlterada(data: Date) {
    if (data.getMonth() != this.dataExibicao.getMonth()
      || data.getFullYear() != this.dataExibicao.getFullYear()) {
      this.dataExibicao = data;
      this.carregarAgendamentos();
    }
  }
}
