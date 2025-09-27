import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContaReceberService } from './contas-receber.service';
import { ContaReceber } from './contas-receber.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule, FormGroup, FormControl } from '@angular/forms';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Paciente } from '../pacientes/paciente.interface';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { PacienteService } from '../pacientes/paciente.service';
import { EmpresaService } from '../empresa/empresa.service';
import { Empresa } from '../empresa/empresa.interface';
import { ContasReceberDetalhesComponent } from './contas-receber-detalhes.component';
import { StatusContaReceber } from '../../core/constans';
import { abrirDatePicker } from '../../core/util-methods';

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
    ContasReceberDetalhesComponent
  ]
})
export class ContaReceberComponent extends BaseListComponent<ContaReceber> implements OnInit {
  override nomeEntidade = 'Conta a Receber';
  pacientes: Paciente[] = [];
  profissionais: Profissional[] = [];
  empresas: Empresa[] = [];
  form = new FormGroup({
    status: new FormControl<number | null>(null),
    paciente: new FormControl<number | null>(null),
    empresa: new FormControl<number | null>(null),
    profissional: new FormControl<number | null>(null),
    dataInicio: new FormControl<string | null>(null),
    dataFim: new FormControl<string | null>(null)
  });

  constructor(private contasReceberService: ContaReceberService,
              private profissionalService: ProfissionalService,
              private pacienteService: PacienteService,
              private empresaService: EmpresaService) {
    super();
    this.form.valueChanges.subscribe(() => {
      this.filtrar();
    });
  }

  ngOnInit(): void {
    this.isLoading = true;
    this.carregarDados();
  }

  ngOnChanges(): void {
    if (this.isLoading) {
      this.carregarDados();
    }
  }

  carregarDados() {
    forkJoin([
      this.carregarContasReceber(),
      this.carregarProfissionais(),
      this.carregarPacientes(),
      this.carregarEmpresas(),
    ]).subscribe(() => {
      this.isLoading = false;
      this.filtrar();
    });
  }

  carregarContasReceber(limparCache: boolean = false) {
    return this.contasReceberService.listar(true, limparCache).pipe(
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

  filtrar() {
    const statusSelecionado = this.form.get('status')?.value;
    const pacienteSelecionado = this.form.get('paciente')?.value;
    const empresaSelecionada = this.form.get('empresa')?.value;
    const profissionalSelecionado = this.form.get('profissional')?.value;
    let matchData = true;
    this.itensExibicao = this.itensInternos.filter(item => {
      const matchStatus = statusSelecionado == null || statusSelecionado == 0 || item.status == statusSelecionado;
      const matchEmpresa = item.empresa == undefined || empresaSelecionada == undefined || empresaSelecionada == 0 || item.empresa.id == empresaSelecionada;
      const matchPaciente = pacienteSelecionado == undefined || pacienteSelecionado == 0 || item.paciente.id == pacienteSelecionado;
      const matchProfissional = profissionalSelecionado == undefined || profissionalSelecionado == 0 || item.profissional.id == profissionalSelecionado;

      const dataInicio = this.form.get('dataInicio')?.value;
      const dataFim = this.form.get('dataFim')?.value;

      if (dataInicio && dataFim) {
        const dataAtendimento = new Date(item.dataAtendimento);
        const inicio = new Date(dataInicio + 'T00:00:00');
        const fim = new Date(dataFim + 'T23:59:59');
        matchData = dataAtendimento >= inicio && dataAtendimento <= fim;
      }

      return matchProfissional && matchPaciente && matchStatus && matchEmpresa && matchData;
    });
    this.atualizarPaginacao();
  }

  override searchTermFilter(contaReceber: ContaReceber, searchTerm: string): boolean | undefined {
    return contaReceber.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  fecharDetalhesContaReceber(infoAlterada: boolean) {
    this.fecharDetalhes();
    if (infoAlterada) {
      this.carregarContasReceber(infoAlterada).subscribe();
    }
  }

  protected readonly StatusContaReceber = StatusContaReceber;

  protected readonly abrirDatePicker = abrirDatePicker;
}
