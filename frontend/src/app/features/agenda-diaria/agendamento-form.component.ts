import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConveniosService } from '../convenio/convenios.service';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { ProfissionaisService } from '../profissionais/profissionais.service';
import { DatePipe, NgClass, NgIf } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresasService } from '../empresa/empresas.service';
import { PacienteFormComponent } from '../pacientes/paciente-form/paciente-form.component';
import { ToastrService } from 'ngx-toastr';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { ProcedimentosService } from '../procedimentos/procedimentos.service';
import { FormComponent } from '../shared/form.component';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { IForm } from '../shared/form.interface';
import { LucideAngularModule } from 'lucide-angular';
import { autoResize, isDataNoFuturo, limitLength } from '../../core/util-methods';
import { FORMAS_PAGAMENTO } from '../../core/constans';
import { forkJoin, map, Observable, tap } from 'rxjs';

@Component({
  selector: 'app-agendamento-form',
  templateUrl: './agendamento-form.component.html',
  imports: [
    NgOptionComponent, NgSelectComponent,
    ReactiveFormsModule, NgClass,
    EmptyToNullDirective, NgxMaskDirective,
    PacienteFormComponent, NgNotFoundTemplateDirective,
    DatePipe, NgIf, LucideAngularModule
  ]
})
export class AgendamentoFormComponent extends FormComponent implements OnInit {
  @Input() agendamento: Agendamento | null = null;
  @Input() horaAgendamento: string | null = null;
  @Output() save = new EventEmitter<Partial<AgendamentoRequest>>();
  @Output() cancel = new EventEmitter<void>();

  titulo: string = 'Novo Agendamento';
  hoje: string;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  profissionais: Profissional[] = [];
  empresas: Empresa[] = [];
  procedimentos: Procedimento[] = [];
  pacienteSelecionado?: Paciente | null;
  empresaSelecionada?: Empresa | null;
  procedimentoSelecionado?: Procedimento | null;
  especialidadeSelecionada?: Especialidade | null;
  mostrarFormularioNovoPaciente: boolean = false;
  showTooltip: boolean = false;
  formasPagamento = FORMAS_PAGAMENTO;
  mostratSalvar: boolean = true;

  protected readonly autoResize = autoResize;
  protected readonly limitLength = limitLength;

  constructor(protected override fb: FormBuilder, private toastr: ToastrService,
              private pacientesService: PacienteService, private conveniosService: ConveniosService,
              private especialidadeService: EspecialidadeService, private profissionaisService: ProfissionaisService,
              private empresasService: EmpresasService, private procedimentosService: ProcedimentosService) {
    super(fb);

    this.hoje = new Date().toISOString().split('T')[0];
    const form: IForm<AgendamentoRequest> = {
      pacienteId: [null, {nonNullable: true}],
      data: [this.hoje, {nonNullable: true}],
      hora: [null, {nonNullable: true}],
      duracao: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(3)]],
      profissionalId: [null, {nonNullable: true}],
      especialidadeId: [null, {nonNullable: true}],
      procedimentoId: [null],
      convenioId: [null],
      empresaId: [null],
      formaPagamento: [null],
      valor: [null],
      desconto: [null],
      observacoes: [null]
    };
    this.form = this.fb.group(form);
  }

  ngOnInit(): void {
    if (this.agendamento) {
      this.mostratSalvar = false;
      this.titulo = 'Detalhes Agendamento';
    }

    forkJoin([
      this.carregarPacientes(),
      this.carregarConvenios(),
      this.carregarEspecialidades(),
      this.carregarProfissionais(),
      this.carregarEmpresas(),
      this.carregarProcedimentos()
    ]).subscribe(() => {
      if (this.agendamento) {
        this.carregaDadosAgendamento();
        this.form.disable();
      }
    });
  }

  carregaDadosAgendamento() {
    if (this.agendamento) {
      this.form.patchValue(this.agendamento);
      this.form.patchValue({
        pacienteId: this.agendamento.paciente.id,
        profissionalId: this.agendamento.profissional.id,
        especialidadeId: this.agendamento.especialidade.id,
        procedimentoId: this.agendamento.procedimento.id,
        convenioId: this.agendamento.convenio?.id,
        empresaId: this.agendamento.empresa?.id,
      });
    }
  }

  carregarPacientes(): Observable<Paciente[]> {
    return this.pacientesService.listar().pipe(
      map(response => response.items),
      tap(pacientes => this.pacientes = pacientes));
  }

  carregarConvenios(): Observable<Convenio[]> {
    return this.conveniosService.listar().pipe(
      map(response => response.items),
      tap(convenios => this.convenios = convenios));
  }

  carregarEspecialidades(): Observable<Especialidade[]> {
    return this.especialidadeService.listar().pipe(
      map(response => response.items),
      tap(especialidades => this.especialidades = especialidades));
  }

  carregarProfissionais(): Observable<Profissional[]> {
    return this.profissionaisService.listar().pipe(
      map(response => response.items),
      tap(profissionais => this.profissionais = profissionais));
  }

  carregarEmpresas(): Observable<Empresa[]> {
    return this.empresasService.listar().pipe(
      map(response => response.items),
      tap(empresas => this.empresas = empresas));
  }

  carregarProcedimentos(): Observable<Procedimento[]> {
    return this.procedimentosService.listar().pipe(
      map(response => response.items),
      tap(procedimentos => this.procedimentos = procedimentos));
  }

  fechar() {
    this.cancel.emit();
  }

  onEdit() {
    this.form.enable();
    this.form.get('pacienteId')?.disable();
    this.mostratSalvar = true;
  }

  selectPaciente(id: number | null) {
    this.pacienteSelecionado = id ? [...this.pacientes.filter(e => e.id === id)].at(0) : null;

    this.form.patchValue({
      pacienteId: this.pacienteSelecionado ? this.pacienteSelecionado.id : null,
      convenioId: this.pacienteSelecionado?.convenio ? this.pacienteSelecionado.convenio.id : null,
      empresaId: this.pacienteSelecionado?.empresa ? this.pacienteSelecionado.empresa.id : null
    });
    this.selectEmpresa(this.pacienteSelecionado?.empresa);
  }

  selectEmpresa(empresa: Empresa | null | undefined) {
    this.empresaSelecionada = empresa;
  }

  selectProcedimento(procedimento: Procedimento | null | undefined) {
    this.procedimentoSelecionado = procedimento;
    this.atualizaPreco();
  }

  salvarNovoPaciente(paciente: Partial<Paciente>) {
    this.pacientesService.criar(paciente).subscribe({
      next: (paciente) => {
        this.toastr.success('Paciente cadastrado');
        this.carregarPacientes();
        this.mostrarFormularioNovoPaciente = false;
        this.selectPaciente(paciente.id);
      }
    });
  }

  cancelarNovoPaciente() {
    this.mostrarFormularioNovoPaciente = false;
  }

  selectEspecialidade(especialidade: Especialidade) {
    this.especialidadeSelecionada = especialidade;
  }

  atualizaPreco() {
    if (this.procedimentoSelecionado) { //TODO - chamar obterPrecoProcedimentoConvenio para obter o preço do convênio
      this.procedimentosService.listarTabelaPreco(this.procedimentoSelecionado.id).subscribe({
        next: (response) => {
          console.log('Tabela de Preço', response);
        }
      });
    }
  }

  formValido(): boolean {
    if (!this.form.valid) {
      return false;
    }
    if (!isDataNoFuturo(this.form.value.data, this.form.value.hora)) {
      this.toastr.warning('O agendamento deve ser em um horário futuro');
      return false;
    }
    if (this.form.value.desconto > this.form.value.valor) {
      this.toastr.warning('O desconto não pode ser maior do que o valor');
      return false;
    }

    return true;
  }

  salvar() {
    if (this.formValido()) {
      this.save.emit(this.form.value);
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }
}
