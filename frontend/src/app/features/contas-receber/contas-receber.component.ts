import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContaReceberService } from './contas-receber.service';
import { ContaReceber } from './contas-receber.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule, FormGroup, FormControl } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';
import {
  CorContaReceber, StatusContaReceber,
  StatusContaReceberDescricao
} from '../../core/constans';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Paciente } from '../pacientes/paciente.interface';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { PacienteService } from '../pacientes/paciente.service';
import { EmpresaService } from '../empresa/empresa.service';
import { Empresa } from '../empresa/empresa.interface';
import { AgendamentoFormComponent } from './contas-receber-detalhes.component';

@Component({
  selector: 'app-contas-receber',
  templateUrl: './contas-receber.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    PaginationComponent,
    TopBarComponent,
    LoadingSpinnerComponent,
    NgNotFoundTemplateDirective,
    NgSelectComponent,
    ReactiveFormsModule,
    NgOptionComponent,
    AgendamentoFormComponent
  ]
})
export class ContaReceberComponent extends BaseListComponent<ContaReceber> implements OnInit {
  override nomeEntidade = 'Conta a Receber';
  pacientes: Paciente[] = [];
  profissionais: Profissional[] = [];
  empresas: Empresa[] = [];
  profissionalFiltro: number = 0;
  pacienteFiltro: number = 0;
  statusFiltro: number = 0;
  empresaFiltro: number = 0;
  dataAtendimentoInicio: Date | null = null;
  dataAtendimentoFim: Date | null = null;
  form = new FormGroup({
    dataInicio: new FormControl<Date | null>(null),
    dataFim: new FormControl<Date | null>(null)
  });

  constructor(private contasReceberService: ContaReceberService,
              private profissionalService: ProfissionalService,
              private pacienteService: PacienteService,
              private empresaService: EmpresaService,
              private toastr: ToastrService) {
    super();
    this.form.valueChanges.subscribe(() => {
      this.filtrar();
    });
  }

  ngOnInit(): void {
    this.isLoading = true;
    forkJoin([
      this.carregarContasReceber(),
      this.carregarProfissionais(),
      this.carregarPacientes(),
      this.carregarEmpresas(),
    ]).subscribe(() => {
      this.isLoading = false;
    });
  }

  carregarContasReceber() {
    this.isLoading = true;
    return this.contasReceberService.listar(true).pipe(
      map(response => response.items),
      tap(contasReceber => {
        this.itensInternos = contasReceber;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
      }));
  }

  carregarProfissionais(): Observable<Profissional[]> {
    return this.profissionalService.listar().pipe(
      map(response => response.items),
      tap(profissionais => {
        this.profissionais = profissionais;
      }));
  }

  carregarPacientes(): Observable<Paciente[]> {
    return this.pacienteService.listar().pipe(
      map(response => response.items),
      tap(pacientes => {
        this.pacientes = pacientes;
      }));
  }

  carregarEmpresas(): Observable<Empresa[]> {
    return this.empresaService.listar().pipe(
      map(response => response.items),
      tap(empresas => {
        this.empresas = empresas;
      }));
  }

  selectPaciente(pacienteId: number) {
    this.pacienteFiltro = pacienteId | 0;
    this.filtrar();
  }

  selectProfissional(profissionalId: number) {
    this.profissionalFiltro = profissionalId | 0;
    this.filtrar();
  }

  selectStatus(statusId: number) {
    this.statusFiltro = statusId | 0;
    this.filtrar();
  }

  selectEmpresa(empresaId: number) {
    this.empresaFiltro = empresaId | 0;
    this.filtrar();
  }

  selectDataAtendimento(event: { inicio: Date, fim: Date } | null) {
    if (event) {
      this.dataAtendimentoInicio = event.inicio;
      this.dataAtendimentoFim = event.fim;
    } else {
      this.dataAtendimentoInicio = null;
      this.dataAtendimentoFim = null;
    }
    this.filtrar();
  }

  filtrar() {
    this.itensExibicao = this.itensInternos.filter(item => {
      const matchProfissional = this.profissionalFiltro == 0 || item.profissional.id == this.profissionalFiltro;
      const matchPaciente = this.pacienteFiltro == 0 || item.paciente.id == this.pacienteFiltro;
      const matchStatus = this.statusFiltro == 0 || item.status == this.statusFiltro;
      const matchEmpresa = this.empresaFiltro == 0 || item.empresa.id == this.empresaFiltro;

      let matchData = true;
      const dataInicio = this.form.get('dataInicio')?.value;
      const dataFim = this.form.get('dataFim')?.value;

      if (dataInicio && dataFim) {
        const dataAtendimento = new Date(item.dataAtendimento);
        dataAtendimento.setHours(0, 0, 0, 0);
        const inicio = new Date(dataInicio);
        const fim = new Date(dataFim);
        fim.setHours(23, 59, 59, 999);

        matchData = dataAtendimento >= inicio && dataAtendimento <= fim;
      }

      return matchProfissional && matchPaciente && matchStatus && matchEmpresa && matchData;
    });
    this.atualizarPaginacao();
  }

  override filter(contaReceber: ContaReceber, searchTerm: string): boolean | undefined {
    return contaReceber.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  protected readonly StatusContaReceberDescricao = StatusContaReceberDescricao;
  protected readonly CorContaReceber = CorContaReceber;
  protected readonly StatusContaReceber = StatusContaReceber;
}
