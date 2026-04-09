import { Component, Input, OnInit } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgSelectComponent } from '@ng-select/ng-select';
import { ConvenioService } from '../convenio/convenio.service';
import { Convenio } from '../convenio/convenio.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { CurrencyPipe, NgClass, NgFor, NgIf } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresaService } from '../empresa/empresa.service';
import { ToastrService } from 'ngx-toastr';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { ProcedimentoService } from '../procedimentos/procedimento.service';
import { FormComponent } from '../shared/form.component';
import { Orcamento, OrcamentoRequest, OrcamentoProcedimento, TIPO_AGENDAMENTO, FORMAS_PAGAMENTO } from './orcamento.interface';
import { OrcamentoService } from './orcamento.service';
import { IForm } from '../shared/form.interface';
import { LucideAngularModule } from 'lucide-angular';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { autoResize } from '../../core/util-methods';

@Component({
  selector: 'app-orcamento-form',
  templateUrl: './orcamento-form.component.html',
  imports: [
    NgSelectComponent,
    ReactiveFormsModule, NgClass,
    EmptyToNullDirective,
    NgIf, LucideAngularModule, ConfirmDialogComponent, CurrencyPipe
  ]
})
export class OrcamentoFormComponent extends FormComponent<Orcamento, OrcamentoRequest> implements OnInit {
  @Input() orcamentoDetalhes: Orcamento | null = null;
  @Input() dataOrcamento: Date | null = null;
  @Input() duracaoDisponibilidade: number | null = null;
  @Input() pacienteId!: number | null;

  protected readonly autoResize = autoResize;
  
  titulo: string = 'Novo Orçamento';
  hoje: string;
  pacientes: Paciente[] = [];
  pacientesFiltrados: Paciente[] = [];
  pacientesParaExibicao: Array<Paciente & { displayLabel?: string }> = [];
  searchCache: Map<string, Array<Paciente & { displayLabel?: string }>> = new Map();
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  especialidadesFiltradas: Especialidade[] = [];
  empresas: Empresa[] = [];
  procedimentosLista: Procedimento[] = [];
  pacienteSelecionado?: Paciente | null;
  empresaSelecionada?: Empresa | null;
  convenioSelecionado?: Convenio | null;
  formasPagamento = FORMAS_PAGAMENTO;
  tipoAgendamento = TIPO_AGENDAMENTO;
  modoSalvar: boolean = true;
  exibeConfirmCancelamento: boolean = false;
  valorTotalOrcamento: number = 0;

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private pacienteService: PacienteService,
    private convenioService: ConvenioService,
    private especialidadeService: EspecialidadeService,
    private empresaService: EmpresaService,
    private procedimentoService: ProcedimentoService,
    private orcamentoService: OrcamentoService
  ) {
    super(fb, toastr);
    const hoje = new Date().toISOString().split('T')[0];
    this.hoje = hoje;

    const form: IForm<OrcamentoRequest> = {
      pacienteId: [null, {nonNullable: true}],
      data: [null, {nonNullable: true}],
      hora: [null, {nonNullable: true}],
      duracao: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(3)]],
      tipoAgendamento: [null, {nonNullable: true}],
      especialidadeId: [null, {nonNullable: true}],
      procedimentoId: [null, {nonNullable: true}],
      convenioId: [null],
      empresaId: [null],
      formaPagamento: [null],
      valor: [null],
      desconto: [null],
      observacoes: [null],
      precoAlterado: [false],
    };
    this.form = this.fb.group({
      ...form,
      procedimentos: this.fb.array([])
    });
  }

  get procedimentos(): FormArray {
    return this.form.get('procedimentos') as FormArray;
  }

  override ngOnInit(): void {
    let data = this.hoje;
    let hora = null;
    let duracao = null;
    if (this.dataOrcamento) {
      const dataISO = this.dataOrcamento.toISOString().split('T')[0];
      data = dataISO;
      const horas = String(this.dataOrcamento.getHours()).padStart(2, '0');
      const minutos = String(this.dataOrcamento.getMinutes()).padStart(2, '0');
      hora = `${horas}:${minutos}`;
    }

    if (this.duracaoDisponibilidade !== null) {
      duracao = this.duracaoDisponibilidade;
    }

    this.form.patchValue({
      data: data,
      hora: hora,
      duracao: duracao
    });
    this.form.markAsPristine();

    if (this.orcamentoDetalhes) {
      this.modoSalvar = false;
      this.titulo = 'Detalhes Orçamento';
    }

    forkJoin([
      this.carregarPacientes(),
      this.carregarConvenios(),
      this.carregarEspecialidades(),
      this.carregarEmpresas(),
      this.carregarProcedimentos()
    ]).subscribe(() => {
      if (this.orcamentoDetalhes) {
        this.carregaDadosOrcamento();
        this.form.disable();
      } else {
        // Desabilitar campos valor e desconto por padrão
        this.form.get('valor')?.disable();
        this.form.get('desconto')?.disable();

        if (this.pacienteId) {
          const pacienteSelecionado = [...this.pacientes.filter(e => e.id === this.pacienteId)].at(0);
          this.selectPaciente(pacienteSelecionado);
        }
      }
      this.calcularValorTotal();

      // Observar mudanças no campo de data para recarregar dados se necessário
      this.form.get('data')?.valueChanges.subscribe(() => {
        // Pode adicionar lógica aqui se necessário
      });
    });
  }

  carregaDadosOrcamento() {
    if (!this.orcamentoDetalhes) return;

    this.form.patchValue({
      pacienteId: this.orcamentoDetalhes.paciente?.id,
      data: this.orcamentoDetalhes.data,
      hora: this.orcamentoDetalhes.hora,
      duracao: this.orcamentoDetalhes.duracao,
      especialidadeId: this.orcamentoDetalhes.especialidade?.id,
      procedimentoId: this.orcamentoDetalhes.procedimento?.id,
      convenioId: this.orcamentoDetalhes.convenio?.id,
      empresaId: this.orcamentoDetalhes.empresa?.id,
      formaPagamento: this.orcamentoDetalhes.formaPagamento,
      valor: this.orcamentoDetalhes.valor,
      desconto: this.orcamentoDetalhes.desconto,
      observacoes: this.orcamentoDetalhes.observacoes,
      precoAlterado: this.orcamentoDetalhes.precoAlterado,
      tipoAgendamento: this.orcamentoDetalhes.tipoAgendamento
    });

    if (this.orcamentoDetalhes.procedimentos) {
      this.orcamentoDetalhes.procedimentos.forEach((proc) => {
        this.adicionarProcedimento(proc);
      });
    }

    this.pacienteSelecionado = this.orcamentoDetalhes.paciente;
    this.convenioSelecionado = this.orcamentoDetalhes.convenio;
    this.empresaSelecionada = this.orcamentoDetalhes.empresa;
  }

  selectPaciente(paciente: Paciente | undefined) {
    if (!paciente) return;
    this.pacienteSelecionado = paciente;
    this.form.get('pacienteId')?.setValue(paciente.id);
  }

  selectEspecialidade(especialidade: Especialidade | undefined) {
    this.form.get('especialidadeId')?.setValue(especialidade?.id);
    if (especialidade) {
      this.filtrarProcedimentos(especialidade.id);
    }
  }

  selectProcedimento(procedimento: Procedimento | undefined) {
    this.form.get('procedimentoId')?.setValue(procedimento?.id);
  }

  selectConvenio(convenio: Convenio | undefined) {
    this.convenioSelecionado = convenio;
    this.form.get('convenioId')?.setValue(convenio?.id);
  }

  selectEmpresa(empresa: Empresa | undefined) {
    this.empresaSelecionada = empresa;
    this.form.get('empresaId')?.setValue(empresa?.id);
  }

  adicionarProcedimento(proc?: OrcamentoProcedimento) {
    const procGroup = this.fb.group({
      id: [proc?.id || null],
      procedimentoId: [proc?.procedimento?.id || null, Validators.required],
      quantidade: [proc?.quantidade || 1, [Validators.required, Validators.min(1)]],
      valor: [proc?.valor || null],
      valorRepasse: [proc?.valorRepasse || null],
      desconto: [proc?.desconto || null]
    });
    this.procedimentos.push(procGroup);
  }

  removerProcedimento(index: number) {
    this.procedimentos.removeAt(index);
    this.calcularValorTotal();
  }

  carregarPacientes(): Observable<Paciente[]> {
    return this.pacienteService.listar().pipe(
      map((response: any) => {
        const pacientes = 'conteudo' in response ? response.conteudo : (Array.isArray(response) ? response : []);
        return pacientes as Paciente[];
      }),
      tap((p: Paciente[]) => {
        this.pacientes = p.sort((a, b) => a.nome.localeCompare(b.nome));
        this.pacientesFiltrados = this.pacientes;
        this.atualizarExibicaoPacientes();
      })
    );
  }

  carregarConvenios(): Observable<Convenio[]> {
    return this.convenioService.listar().pipe(
      map((response: any) => ('conteudo' in response ? response.conteudo : (Array.isArray(response) ? response : [])) as Convenio[]),
      tap((c: Convenio[]) => this.convenios = c)
    );
  }

  carregarEspecialidades(): Observable<Especialidade[]> {
    return this.especialidadeService.listar().pipe(
      map((response: any) => ('conteudo' in response ? response.conteudo : (Array.isArray(response) ? response : [])) as Especialidade[]),
      tap((e: Especialidade[]) => this.especialidades = e)
    );
  }

  carregarEmpresas(): Observable<Empresa[]> {
    return this.empresaService.listar().pipe(
      map((response: any) => ('conteudo' in response ? response.conteudo : (Array.isArray(response) ? response : [])) as Empresa[]),
      tap((e: Empresa[]) => this.empresas = e)
    );
  }

  carregarProcedimentos(): Observable<Procedimento[]> {
    return this.procedimentoService.listar().pipe(
      map((response: any) => ('conteudo' in response ? response.conteudo : (Array.isArray(response) ? response : [])) as Procedimento[]),
      tap((p: Procedimento[]) => this.procedimentosLista = p)
    );
  }

  filtrarProcedimentos(especialidadeId: number) {
    const especialidade = this.especialidades.find(e => e.id === especialidadeId);
    if (especialidade) {
      this.especialidadesFiltradas = [especialidade];
    }
  }

  atualizarExibicaoPacientes() {
    if (this.pacientesFiltrados.length <= 100) {
      this.pacientesParaExibicao = this.pacientesFiltrados;
    } else {
      this.pacientesParaExibicao = this.pacientesFiltrados.slice(0, 100);
    }
  }

  onSearchPaciente(event: any) {
    const searchTerm = event?.term?.toLowerCase() || '';
    if (searchTerm.length < 3) {
      this.pacientesFiltrados = this.pacientes;
    } else if (this.searchCache.has(searchTerm)) {
      this.pacientesFiltrados = this.searchCache.get(searchTerm)!;
    } else {
      this.pacientesFiltrados = this.pacientes.filter(p =>
        p.nome.toLowerCase().includes(searchTerm) ||
        p.documento?.includes(searchTerm)
      );
      this.searchCache.set(searchTerm, this.pacientesFiltrados);
    }
    this.atualizarExibicaoPacientes();
  }

  calcularValorTotal() {
    let total = 0;

    // Valor principal
    const valor = this.form.get('valor')?.value;
    if (valor) {
      total += parseFloat(valor) || 0;
    }

    // Valor dos procedimentos adicionais
    this.procedimentos.controls.forEach((proc: any) => {
      const procVal = proc.get('valor')?.value;
      const procQtd = proc.get('quantidade')?.value || 1;
      if (procVal) {
        total += (parseFloat(procVal) || 0) * procQtd;
      }
    });

    // Desconto
    const desconto = this.form.get('desconto')?.value;
    if (desconto) {
      total -= parseFloat(desconto) || 0;
    }

    this.valorTotalOrcamento = total > 0 ? total : 0;
  }

  perguntaCancelamento() {
    this.exibeConfirmCancelamento = true;
  }

  submit() {
    if (!this.form.valid) {
      this.toastr.error('Preencha todos os campos obrigatórios');
      return;
    }

    const formValue = this.form.getRawValue() as OrcamentoRequest;
    formValue.procedimentos = this.procedimentos.value as OrcamentoProcedimento[];
    
    this.save.emit(formValue);
  }
}
