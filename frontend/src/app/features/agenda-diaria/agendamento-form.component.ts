import { Component, Input, OnInit } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConvenioService } from '../convenio/convenio.service';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { ProfissionalService } from '../profissionais/profissional.service';
import { DatePipe, NgClass, NgIf } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresaService } from '../empresa/empresa.service';
import { PacienteFormComponent } from '../pacientes/paciente-form/paciente-form.component';
import { ToastrService } from 'ngx-toastr';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { ProcedimentoService } from '../procedimentos/procedimento.service';
import { FormComponent } from '../shared/form.component';
import { Agendamento, AgendamentoRequest, podeEditarAgendamento } from './agendamento.interface';
import { IForm } from '../shared/form.interface';
import { LucideAngularModule } from 'lucide-angular';
import { autoResize, isDataNoFuturo, limitLength } from '../../core/util-methods';
import {
  FORMAS_PAGAMENTO,
  STATUS_ABRIR_ATENDIMENTO, StatusAgendamento,
  TIPO_AGENDAMENTO
} from '../../core/constans';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { UserService } from '../../core/user.service';
import { ColorUtils } from '../../core/color-utils';
import { Router } from '@angular/router';
import { AtendimentoService } from '../atendimento/atendimento.service';

@Component({
  selector: 'app-agendamento-form',
  templateUrl: './agendamento-form.component.html',
  imports: [
    NgOptionComponent, NgSelectComponent,
    ReactiveFormsModule, NgClass,
    EmptyToNullDirective, NgxMaskDirective,
    PacienteFormComponent, NgNotFoundTemplateDirective,
    DatePipe, NgIf, LucideAngularModule, ConfirmDialogComponent
  ]
})
export class AgendamentoFormComponent extends FormComponent<Agendamento, AgendamentoRequest> implements OnInit {
  @Input() agendamentoDetalhes: Agendamento | null = null;
  @Input() dataAgendamento: Date | null = null;
  @Input() pacienteId!: number | null;
  @Input() profissionalId: number | null = null;

  titulo: string = 'Novo Agendamento';
  hoje: string;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  profissionais: Profissional[] = [];
  profissionaisFiltrados: Profissional[] = [];
  empresas: Empresa[] = [];
  procedimentos: Procedimento[] = [];
  procedimentosFiltrados: Procedimento[] = [];
  pacienteSelecionado?: Paciente | null;
  empresaSelecionada?: Empresa | null;
  procedimentoSelecionado?: Procedimento | null;
  convenioSelecionado?: Convenio | null;
  mostrarFormularioNovoPaciente: boolean = false;
  showTooltip: boolean = false;
  formasPagamento = FORMAS_PAGAMENTO;
  tipoAgendamento = TIPO_AGENDAMENTO;
  modoSalvar: boolean = true;
  exibeConfirmCancelamento: boolean = false;
  valorEditavel: boolean = false;
  valorAntesEdicao: number | null = null;
  isLoading: boolean = false;

  protected readonly autoResize = autoResize;
  protected readonly limitLength = limitLength;

  constructor(protected override fb: FormBuilder, protected override toastr: ToastrService,
              private pacienteService: PacienteService, private convenioService: ConvenioService,
              private especialidadeService: EspecialidadeService, private profissionalService: ProfissionalService,
              private empresaService: EmpresaService, private procedimentoService: ProcedimentoService,
              protected userService: UserService, private router: Router,
              private atendimentoService: AtendimentoService) {
    super(fb, toastr);
    this.hoje = new Date().toISOString().split('T')[0];
    const form: IForm<AgendamentoRequest> = {
      pacienteId: [null, {nonNullable: true}],
      data: [null, {nonNullable: true}],
      hora: [null, {nonNullable: true}],
      duracao: [null, [Validators.required, Validators.minLength(2), Validators.maxLength(3)]],
      tipoAgendamento: [null, {nonNullable: true}],
      profissionalId: [null, {nonNullable: true}],
      especialidadeId: [null, {nonNullable: true}],
      procedimentoId: [null],
      convenioId: [null],
      empresaId: [null],
      formaPagamento: [null],
      valor: [null],
      desconto: [null],
      observacoes: [null],
      precoAlterado: [false],
      encaixe: [false],
    };
    this.form = this.fb.group(form);
  }

  override ngOnInit(): void {
    let data = this.hoje;
    let hora = null;
    if (this.dataAgendamento) {
      data = this.dataAgendamento.toISOString().split('T')[0];
      const horas = String(this.dataAgendamento.getHours()).padStart(2, '0');
      const minutos = String(this.dataAgendamento.getMinutes()).padStart(2, '0');
      hora = `${horas}:${minutos}`;
    }

    this.form.patchValue({
      data: data,
      hora: hora
    });
    this.form.markAsPristine();

    if (this.agendamentoDetalhes) {
      this.modoSalvar = false;
      this.titulo = 'Detalhes Agendamento';
    }

    this.isLoading = true;
    forkJoin([
      this.carregarPacientes(),
      this.carregarConvenios(),
      this.carregarEspecialidades(),
      this.carregarProfissionais(),
      this.carregarEmpresas(),
      this.carregarProcedimentos()
    ]).subscribe(() => {
      if (this.agendamentoDetalhes) {
        this.carregaDadosAgendamento();
        this.form.disable();
      } else {
        if (this.pacienteId) {
          this.selectPaciente(this.pacienteId);
        }
        if (this.profissionalId) {
          this.selectProfissional(this.profissionalId);
        }
      }
      this.isLoading = false;
    });
  }

  carregaDadosAgendamento() {
    if (this.agendamentoDetalhes) {
      this.form.patchValue(this.agendamentoDetalhes);
      this.form.patchValue({
        pacienteId: this.agendamentoDetalhes.paciente.id,
        profissionalId: this.agendamentoDetalhes.profissional.id,
        especialidadeId: this.agendamentoDetalhes.especialidade.id,
        procedimentoId: this.agendamentoDetalhes.procedimento?.id,
        convenioId: this.agendamentoDetalhes.convenio?.id,
        empresaId: this.agendamentoDetalhes.empresa?.id,
      });
      this.form.markAsPristine();
    }
  }

  carregarPacientes(): Observable<Paciente[]> {
    return this.pacienteService.listar().pipe(
      map(response => response.items),
      tap(pacientes => this.pacientes = pacientes));
  }

  carregarConvenios(): Observable<Convenio[]> {
    return this.convenioService.listar().pipe(
      map(response => response.items),
      tap(convenios => this.convenios = convenios));
  }

  carregarEspecialidades(): Observable<Especialidade[]> {
    return this.especialidadeService.listar().pipe(
      map(response => response.items),
      tap(especialidades => this.especialidades = especialidades));
  }

  carregarProfissionais(): Observable<Profissional[]> {
    return this.profissionalService.listar().pipe(
      map(response => response.items),
      tap(profissionais => { this.profissionais = profissionais;
        this.profissionaisFiltrados = profissionais;}));
  }

  carregarEmpresas(): Observable<Empresa[]> {
    return this.empresaService.listar().pipe(
      map(response => response.items),
      tap(empresas => this.empresas = empresas));
  }

  carregarProcedimentos(): Observable<Procedimento[]> {
    return this.procedimentoService.listar().pipe(
      map(response => response.items),
      tap(procedimentos => {
        this.procedimentos = procedimentos;
        this.procedimentosFiltrados = procedimentos;
      }));
  }

  fechar(confirmou: boolean = false) {
    if (!confirmou && this.form.dirty) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }

  onEdit() {
    this.form.enable();
    this.form.get('pacienteId')?.disable();
    this.modoSalvar = true;
  }

  selectPaciente(id: number | null) {
    this.pacienteSelecionado = id ? [...this.pacientes.filter(e => e.id === id)].at(0) : null;

    this.form.patchValue({
      pacienteId: this.pacienteSelecionado ? this.pacienteSelecionado.id : null,
      convenioId: this.pacienteSelecionado?.convenio ? this.pacienteSelecionado.convenio.id : null,
      empresaId: this.pacienteSelecionado?.empresa ? this.pacienteSelecionado.empresa.id : null
    });
    this.selectEmpresa(this.pacienteSelecionado ? this.pacienteSelecionado?.empresa : null);
  }

  selectEmpresa(empresa: Empresa | null) {
    this.empresaSelecionada = empresa;
  }

  selectProcedimento(procedimento: Procedimento | null) {
    this.procedimentoSelecionado = procedimento;
    this.atualizaPreco();
  }

  selectProfissional(id: number | null) {
    const profissional = id ? [...this.profissionais.filter(p => p.id == id)].at(0) : null;
    this.form.patchValue({
      profissionalId: profissional ? profissional.id : null
    });
  }

  selectTipo(tipo: { valor: number, descricao: string } | null) {
    this.procedimentosFiltrados = tipo ? [...this.procedimentos.filter(p => p.tipo == tipo.valor)] : this.procedimentos;
  }

  salvarNovoPaciente(paciente: Partial<Paciente>) {
    this.isLoading = true;
    this.mostrarFormularioNovoPaciente = false;
    this.pacienteService.criar(paciente).subscribe({
      next: (paciente) => {
        this.toastr.success('Paciente cadastrado');
        this.carregarPacientes().subscribe({
          next: () => {
            this.selectPaciente(paciente.id);
            this.isLoading = false;
          }
        });
      }
    });
  }

  cancelarNovoPaciente() {
    this.mostrarFormularioNovoPaciente = false;
  }

  selectEspecialidade(especialidade: Especialidade | null) {
    if (especialidade) {
      this.profissionaisFiltrados = this.profissionais.filter(p =>
        p.especialidades?.some(e => e.id === especialidade.id)
      );
    } else {
      this.profissionaisFiltrados = this.profissionais;
    }
  }

  selectConvenio(convenio: Convenio | null) {
    this.convenioSelecionado = convenio;
    this.atualizaPreco();
  }

  editaValor() {
    this.valorAntesEdicao = this.form.value.valor;
    this.valorEditavel = true;
    this.form.patchValue({
      precoAlterado: true
    });
    this.form.markAsPristine();
  }

  cancelarEdicaoValor() {
    this.valorEditavel = false;
    this.form.patchValue({
      valor: this.valorAntesEdicao,
      precoAlterado: false
    });
    this.valorAntesEdicao = null;
  }

  atualizaPreco() {
    if (this.procedimentoSelecionado && this.convenioSelecionado) {
      this.procedimentoService.obterPrecoProcedimentoConvenio(this.procedimentoSelecionado.id, this.convenioSelecionado.id).subscribe({
        next: (response) => {
          this.form.patchValue({
            valor: response.preco
          })
        },
        error: () => {
          if (this.procedimentoSelecionado) {
            this.form.patchValue({
              valor: this.procedimentoSelecionado.valorPadrao
            });
          }
        }
      });
    }
    const valor = this.procedimentoSelecionado != null && this.procedimentoSelecionado?.valorPadrao != null ? this.procedimentoSelecionado.valorPadrao : null;
    this.form.patchValue({
      valor: valor
    });
  }

  podeAbrirAtendimento(agendamento: Agendamento | null): boolean {
    if (agendamento == null) {
      return false;
    }
    if (!STATUS_ABRIR_ATENDIMENTO.includes(agendamento.status)) {
      return false;
    }
    return this.userService.isMedico();
  }

  abrirAtendimento(agendamento: Agendamento | null) {
    if (agendamento == null) {
      return;
    }

    this.isLoading = true;

    const agendamentoId = agendamento.id;
    return this.atendimentoService.iniciarAtendimento(agendamentoId)
      .subscribe({
        next: (response) => {
          const atendimentoId = response.id;
          return this.router.navigate(['/atendimentos'], {
            state: {
              'agendamentoId': agendamentoId,
              'atendimentoId': atendimentoId
            }
          });
        },
        error: () => {
          this.isLoading = false;
        }
      });
  }

  podeEditar(): boolean {
    return !this.userService.isMedico()
      && !this.modoSalvar
      && this.agendamentoDetalhes != null
      && podeEditarAgendamento(this.agendamentoDetalhes);
  }

  formValido(): boolean {
    if (!this.form.valid) {
      return false;
    }
    if (!isDataNoFuturo(this.form.value.data, this.form.value.hora) && !this.agendamentoDetalhes) {
      this.toastr.warning('O agendamento deve ser em um horário futuro');
      return false;
    }
    if (this.form.value.desconto > this.form.value.valor) {
      this.toastr.warning('O desconto não pode ser maior do que o valor');
      return false;
    }

    return true;
  }

  override onSubmit() {
    if (this.formValido()) {
      this.form.get('pacienteId')?.enable();
      this.save.emit(this.form.value);
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  protected readonly ColorUtils = ColorUtils;
  protected readonly StatusAgendamento = StatusAgendamento;
}
