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
import { ToastrService } from 'ngx-toastr';

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
  itensSelecionados: Set<number> = new Set();
  mostrarDropdownAcoes: boolean = false;

  form = new FormGroup({
    status: new FormControl<number | null>(null),
    paciente: new FormControl<number | null>(null),
    empresa: new FormControl<number | null>(null),
    profissional: new FormControl<number | null>(null),
    dataInicio: new FormControl<string | null>(null),
    dataFim: new FormControl<string | null>(null)
  });

  constructor(private contasReceberService: ContaReceberService,
              protected override toastr: ToastrService,
              private profissionalService: ProfissionalService,
              private pacienteService: PacienteService,
              private empresaService: EmpresaService) {
    super(contasReceberService, toastr);
    this.form.valueChanges.subscribe(() => {
      this.filtrar();
    });
  }

  override ngOnInit(): void {
    this.isLoading = true;
    this.carregarDados();
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
        const dataAgendamento = new Date(item.dataAgendamento);
        const inicio = new Date(dataInicio + 'T00:00:00');
        const fim = new Date(dataFim + 'T23:59:59');
        matchData = dataAgendamento >= inicio && dataAgendamento <= fim;
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

  toggleSelecao(id: number, event: Event) {
    event.stopPropagation();
    if (this.itensSelecionados.has(id)) {
      this.itensSelecionados.delete(id);
    } else {
      this.itensSelecionados.add(id);
    }
  }

  toggleSelecaoTodos(event: Event) {
    const checkbox = event.target as HTMLInputElement;
    if (checkbox.checked) {
      this.getItensPaginados().forEach(item => this.itensSelecionados.add(item.id));
    } else {
      this.getItensPaginados().forEach(item => this.itensSelecionados.delete(item.id));
    }
  }

  isSelecionado(id: number): boolean {
    return this.itensSelecionados.has(id);
  }

  todosSelecionados(): boolean {
    const itensPaginados = this.getItensPaginados();
    return itensPaginados.length > 0 && itensPaginados.every(item => this.itensSelecionados.has(item.id));
  }

  algumSelecionado(): boolean {
    return this.itensSelecionados.size > 0;
  }

  podeGerarPDF(): boolean {
    const empresaSelecionada = this.form.get('empresa')?.value;
    const pacienteSelecionado = this.form.get('paciente')?.value;
    return this.algumSelecionado() &&
           ((empresaSelecionada != null && empresaSelecionada != 0) ||
            (pacienteSelecionado != null && pacienteSelecionado != 0));
  }

  gerarPDF() {
    if (!this.podeGerarPDF()) {
      this.toastr.warning('Selecione uma empresa ou paciente no filtro para gerar o PDF');
      return;
    }

    const ids = Array.from(this.itensSelecionados);
    this.contasReceberService.gerarPDF(ids).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;

        const empresaSelecionada = this.form.get('empresa')?.value;
        const pacienteSelecionado = this.form.get('paciente')?.value;
        let nomeArquivo = 'contas-receber';

        if (empresaSelecionada && empresaSelecionada != 0) {
          const empresa = this.empresas.find(e => e.id == empresaSelecionada);
          nomeArquivo = `contas-receber-${empresa?.nome.toLowerCase().replace(/\s+/g, '-')}`;
        } else if (pacienteSelecionado && pacienteSelecionado != 0) {
          const paciente = this.pacientes.find(p => p.id == pacienteSelecionado);
          nomeArquivo = `contas-receber-${paciente?.nome.toLowerCase().replace(/\s+/g, '-')}`;
        }

        link.download = `${nomeArquivo}.pdf`;
        link.click();
        window.URL.revokeObjectURL(url);

        this.toastr.success('PDF gerado com sucesso');
        this.itensSelecionados.clear();
        this.mostrarDropdownAcoes = false;
      },
      error: () => {
        this.toastr.error('Erro ao gerar PDF');
      }
    });
  }

  protected readonly StatusContaReceber = StatusContaReceber;
  protected readonly abrirDatePicker = abrirDatePicker;
}
