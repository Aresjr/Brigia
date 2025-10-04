import { Component, OnDestroy, OnInit } from '@angular/core';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { AgendamentoFormComponent } from './agendamento-form.component';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { CalendarioComponent } from '../shared/calendario/calendario.component';
import { CalendarEvent } from 'angular-calendar';
import { NavigationEnd, Router } from '@angular/router';
import { AgendamentoService } from './agendamento.service';
import { ToastrService } from 'ngx-toastr';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { EventoFactory } from '../../core/evento-factory';
import { UserService } from '../../core/user.service';
import { LucideAngularModule } from 'lucide-angular';
import { FabComponent } from '../shared/fab/fab.component';
import { filter } from 'rxjs/operators';
import { NgIf } from '@angular/common';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Subscription, interval } from 'rxjs';
import { PacienteService } from '../pacientes/paciente.service';
import { Paciente } from '../pacientes/paciente.interface';
import { DisponibilidadeFormComponent } from '../disponibilidade/disponibilidade-form.component';
import { DisponibilidadeRequest } from '../disponibilidade/disponibilidade.interface';
import { DisponibilidadeService } from '../disponibilidade/disponibilidade.service';

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
    NgSelectComponent,
    DisponibilidadeFormComponent
  ],
  templateUrl: './agenda-diaria.component.html'
})
export class AgendaDiariaComponent implements OnInit, OnDestroy {
  agendamentoDetalhes: Agendamento | null = null;
  dataAgendamento: Date | null = null;
  eventosExibicao: CalendarEvent<Agendamento>[] = [];
  eventosInternos: CalendarEvent<Agendamento>[] = [];
  profissionais: Profissional[] = [];
  pacientes: Paciente[] = [];
  exibeForm: boolean = false;
  exibeFormDisponibilidade: boolean = false;
  disponibilidadeDetalhes: any = null;
  pacienteId: number | null = null;
  isLoading: boolean = false;
  dataExibicao: Date = new Date();
  profissionalFiltro: number = 0;
  pacienteFiltro: number = 0;
  private subscription!: Subscription;
  modoVisualizacao: 'agendamentos' | 'disponibilidades' = 'agendamentos';

  constructor(private router: Router, private toastr: ToastrService,
              private agendamentoService: AgendamentoService,
              private profissionalService: ProfissionalService,
              private pacienteService: PacienteService,
              private disponibilidadeService: DisponibilidadeService,
              protected userService: UserService) {
    const navigation = this.router.getCurrentNavigation();
    const pacienteId = navigation?.extras.state?.['pacienteId'];
    this.pacienteId = pacienteId ? pacienteId : null;
  }

  ngOnInit(): void {
    this.carregarDados();

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

    this.subscription = interval(1000 * 60).subscribe(() => {
      this.carregarAgendamentos();
    });
  }

  carregarDados() {
    this.carregarAgendamentos();
    this.carregarPacientes();
    if (!this.userService.isMedico()) {
      this.carregarProfissionais();
    }
  }

  carregarAgendamentos() {
    this.isLoading = true;

    const ano = this.dataExibicao.getFullYear();
    const mes = this.dataExibicao.getMonth() + 1;

    const agendamentos$ = this.agendamentoService.listarPorData(ano, mes);
    const disponibilidades$ = this.disponibilidadeService.listarPorData(ano, mes);

    agendamentos$.subscribe({
      next: agendamentosResponse => {
        const eventosAgendamentos = agendamentosResponse.items.map(a => EventoFactory.fromAgendamento(a));

        disponibilidades$.subscribe({
          next: disponibilidadesResponse => {
            const eventosDisponibilidades = disponibilidadesResponse.items.map(d => EventoFactory.fromDisponibilidade(d));
            this.eventosInternos = [...eventosDisponibilidades, ...eventosAgendamentos];

            this.filtrarRegistros();
            this.isLoading = false;
          },
          error: () => {
            this.eventosInternos = eventosAgendamentos;
            this.filtrarRegistros();
            this.isLoading = false;
          }
        });
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  carregarProfissionais() {
    this.profissionalService.listar().subscribe({
      next: value => {
        this.profissionais = value.items;
      }
    });
  }

  carregarPacientes() {
    this.pacienteService.listar().subscribe({
      next: value => {
        this.pacientes = value.items;
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

  selectProfissional(profissionalId: number) {
    this.profissionalFiltro = profissionalId;
    this.filtrarProfissional();
  }

  selectPaciente(pacienteId: number) {
    this.pacienteFiltro = pacienteId;
    this.filtrarPaciente();
  }

  filtrarRegistros() {
    let eventosFiltrados = [...this.eventosInternos];

    if (this.modoVisualizacao === 'disponibilidades') {
      eventosFiltrados = eventosFiltrados.filter(item => !item.meta?.paciente);
    }

    // Filtrar por profissional
    if (this.profissionalFiltro && this.profissionalFiltro != 0) {
      eventosFiltrados = eventosFiltrados.filter(item => item.meta?.profissional.id == this.profissionalFiltro);
    }

    // Filtrar por paciente (apenas agendamentos têm paciente)
    if (this.pacienteFiltro && this.pacienteFiltro != 0) {
      eventosFiltrados = eventosFiltrados.filter(item => item.meta?.paciente?.id == this.pacienteFiltro);
    }

    this.eventosExibicao = eventosFiltrados;
  }

  filtrarProfissional() {
    this.filtrarRegistros();
  }

  filtrarPaciente() {
    this.filtrarRegistros();
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

  ngOnDestroy() {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }
  }

  alternarModoVisualizacao(modo: 'agendamentos' | 'disponibilidades') {
    this.modoVisualizacao = modo;
    this.filtrarRegistros();
  }

  addDisponibilidade() {
    this.exibeFormDisponibilidade = true;
  }

  fecharFormDisponibilidade() {
    this.disponibilidadeDetalhes = null;
    this.exibeFormDisponibilidade = false;
  }

  salvarDisponibilidade(disponibilidade: Partial<DisponibilidadeRequest>) {
    this.disponibilidadeService.criar(disponibilidade).subscribe({
      next: () => {
        this.toastr.success('Disponibilidade criada');
        this.carregarAgendamentos();
        this.fecharFormDisponibilidade();
      }
    });
  }

  detalhesDisponibilidade(disponibilidade: any) {
    this.disponibilidadeDetalhes = disponibilidade;
    this.exibeFormDisponibilidade = true;
  }
}
