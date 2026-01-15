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
import { DisponibilidadeService } from '../disponibilidade/disponibilidade.service';
import { HonorariosFormComponent } from '../honorarios/honorarios-form.component';
import { AgendaSemanalService } from '../agenda-semanal/agenda-semanal.service';
import { ContaReceberService } from '../contas-receber/contas-receber.service';
import { FilaEsperaService } from '../fila-espera/fila-espera.service';
import { FilaEspera } from '../fila-espera/fila-espera.interface';
import { FilaEsperaListaComponent } from '../fila-espera/fila-espera-lista.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';

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
    DisponibilidadeFormComponent,
    HonorariosFormComponent,
    FilaEsperaListaComponent,
    ConfirmDialogComponent
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
  exibeFormHonorarios: boolean = false;
  disponibilidadeDetalhes: any = null;
  pacienteId: number | null = null;
  isLoading: boolean = false;
  dataExibicao: Date = new Date();
  profissionalFiltro: number = 0;
  pacienteFiltro: number = 0;
  private subscription!: Subscription;
  modoVisualizacao: 'tudo' | 'agendamentos' | 'disponibilidades' | 'filaEspera' = 'tudo';
  filaEsperaLista: FilaEspera[] = [];
  filaEsperaSelecionada: FilaEspera | null = null;
  exibeConfirmExclusaoFilaEspera: boolean = false;
  filaEsperaParaExcluir: FilaEspera | null = null;

  constructor(private router: Router, private toastr: ToastrService,
              private agendamentoService: AgendamentoService,
              private profissionalService: ProfissionalService,
              private pacienteService: PacienteService,
              private disponibilidadeService: DisponibilidadeService,
              private agendaSemanalService: AgendaSemanalService,
              private contaReceberService: ContaReceberService,
              private filaEsperaService: FilaEsperaService,
              protected userService: UserService) {
    const navigation = this.router.getCurrentNavigation();
    const pacienteId = navigation?.extras.state?.['pacienteId'];
    this.pacienteId = pacienteId ? pacienteId : null;
  }

  ngOnInit(): void {
    this.carregarDados();

    if (this.pacienteId) {
      this.addNovo();
    }

    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: NavigationEnd) => {
        if (event.urlAfterRedirects === '/agenda-diaria') {
          this.carregarAgendamentos();
        }
      });

    this.subscription = interval(1000 * 60 * 10).subscribe(() => {
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

    // Calcular intervalo de datas para o mês
    const primeiroDiaMes = new Date(ano, mes - 1, 1);
    primeiroDiaMes.setDate(primeiroDiaMes.getDate() - 30); // Buscar 30 dias antes

    const ultimoDiaMes = new Date(ano, mes, 0);
    ultimoDiaMes.setDate(ultimoDiaMes.getDate() + 30); // Buscar 30 dias depois

    const agendamentos$ = this.agendamentoService.listarPorData(ano, mes);
    const disponibilidades$ = this.disponibilidadeService.listarPorData(ano, mes);
    const agendasSemanais$ = this.agendaSemanalService.listarPorProfissional(this.profissionalFiltro || null);

    agendamentos$.subscribe({
      next: agendamentosResponse => {
        const eventosAgendamentos = agendamentosResponse.items.map(a => EventoFactory.fromAgendamento(a));

        disponibilidades$.subscribe({
          next: disponibilidadesResponse => {
            const eventosDisponibilidades = disponibilidadesResponse.items.map(d => EventoFactory.fromDisponibilidade(d));

            // Buscar agendas semanais
            agendasSemanais$.subscribe({
              next: agendasSemanais => {
                // Converter cada agenda semanal em eventos para o período
                const eventosAgendasSemanais: any[] = [];
                agendasSemanais.forEach(agendaSemanal => {
                  const eventos = EventoFactory.fromAgendaSemanal(agendaSemanal, primeiroDiaMes, ultimoDiaMes);
                  eventosAgendasSemanais.push(...eventos);
                });

                this.eventosInternos = [...eventosDisponibilidades, ...eventosAgendasSemanais, ...eventosAgendamentos];
                this.filtrarRegistros();
                this.isLoading = false;
              },
              error: () => {
                // Continuar sem agendas semanais em caso de erro
                this.eventosInternos = [...eventosDisponibilidades, ...eventosAgendamentos];
                this.filtrarRegistros();
                this.isLoading = false;
              }
            });
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

  addNovo() {
    this.dataAgendamento = null;
    this.agendamentoDetalhes = null;
    this.filaEsperaSelecionada = null;
    this.exibeForm = true;
  }

  criarAgendamentoDeFilaEspera(filaEspera: FilaEspera) {
    this.filaEsperaSelecionada = filaEspera;
    this.dataAgendamento = null;
    this.agendamentoDetalhes = null;
    this.pacienteId = filaEspera.paciente.id;
    this.exibeForm = true;
  }

  removerFilaEspera(filaEspera: FilaEspera) {
    this.filaEsperaParaExcluir = filaEspera;
    this.exibeConfirmExclusaoFilaEspera = true;
  }

  confirmarExclusaoFilaEspera() {
    if (this.filaEsperaParaExcluir) {
      this.filaEsperaService.excluir(this.filaEsperaParaExcluir.id).subscribe({
        next: () => {
          this.toastr.success('Paciente removido da fila de espera');
          this.carregarFilaEspera();
          this.cancelarExclusaoFilaEspera();
        },
        error: () => {
          this.cancelarExclusaoFilaEspera();
        }
      });
    }
  }

  cancelarExclusaoFilaEspera() {
    this.exibeConfirmExclusaoFilaEspera = false;
    this.filaEsperaParaExcluir = null;
  }

  fecharForm() {
    this.agendamentoDetalhes = null;
    this.filaEsperaSelecionada = null;
    this.exibeForm = false;
    // Atualizar lista da fila de espera caso tenha sido adicionado um novo registro
    this.carregarFilaEspera();
    // Recarregar agendamentos para refletir mudanças de status
    this.carregarAgendamentos();
  }

  salvar(agendamento: Partial<AgendamentoRequest>) {
    if (this.agendamentoDetalhes) {
      this.agendamentoService.atualizar(this.agendamentoDetalhes.id, agendamento).subscribe({
        next: () => {
          this.toastr.success('Agendamento atualizado');
          this.contaReceberService.limparCache();
          this.carregarAgendamentos();
          this.exibeForm = false;
          this.agendamentoDetalhes = null;
        }
      });
    } else {
      this.agendamentoService.criar(agendamento).subscribe({
        next: () => {
          this.toastr.success(`Agendamento realizado`);
          this.contaReceberService.limparCache();
          this.carregarAgendamentos();

          // Se foi criado a partir da fila de espera, marcar como excluído
          if (this.filaEsperaSelecionada) {
            this.filaEsperaService.excluir(this.filaEsperaSelecionada.id).subscribe({
              next: () => {
                this.carregarFilaEspera();
              }
            });
          }

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

    // Filtrar por modo de visualização
    if (this.modoVisualizacao === 'agendamentos') {
      // Mostrar apenas agendamentos (itens com paciente)
      eventosFiltrados = eventosFiltrados.filter(item => item.meta?.paciente);
    } else if (this.modoVisualizacao === 'disponibilidades') {
      // Mostrar apenas disponibilidades (itens sem paciente)
      eventosFiltrados = eventosFiltrados.filter(item => !item.meta?.paciente);
    }
    // Se for 'tudo', não filtra por tipo

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

  alternarModoVisualizacao(modo: 'tudo' | 'agendamentos' | 'disponibilidades' | 'filaEspera') {
    this.modoVisualizacao = modo;
    if (modo === 'filaEspera') {
      this.carregarFilaEspera();
    } else {
      this.filtrarRegistros();
    }
  }

  addDisponibilidade() {
    this.exibeFormDisponibilidade = true;
  }

  fecharFormDisponibilidade() {
    this.disponibilidadeDetalhes = null;
    this.exibeFormDisponibilidade = false;
  }

  gerarHonorarios() {
    this.exibeFormHonorarios = true;
  }

  fecharFormHonorarios() {
    this.exibeFormHonorarios = false;
  }

  detalhesDisponibilidade(disponibilidade: any) {
    this.disponibilidadeDetalhes = disponibilidade;
    this.exibeFormDisponibilidade = true;
  }

  carregarFilaEspera() {
    this.isLoading = true;
    this.filaEsperaService.listar(false, true).subscribe({
      next: response => {
        this.filaEsperaLista = response.items;
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar fila de espera');
      }
    });
  }
}
