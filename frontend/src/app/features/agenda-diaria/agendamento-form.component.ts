import { Component, Input, OnInit } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConvenioService } from '../convenio/convenio.service';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { ProfissionalService } from '../profissionais/profissional.service';
import { CurrencyPipe, DatePipe, NgClass, NgFor, NgIf } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresaService } from '../empresa/empresa.service';
import { PacienteFormComponent } from '../pacientes/paciente-form/paciente-form.component';
import { ToastrService } from 'ngx-toastr';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { ProcedimentoService } from '../procedimentos/procedimento.service';
import { FormComponent } from '../shared/form.component';
import {
  Agendamento,
  AgendamentoRequest, podeAbrirAtendimento,
  podeEditarAgendamento,
  StatusAgendamento,
  StatusAgendamentoEnum,
  TIPO_AGENDAMENTO
} from './agendamento.interface';
import { AgendamentoService } from './agendamento.service';
import { IForm } from '../shared/form.interface';
import { LucideAngularModule } from 'lucide-angular';
import { abrirDatePicker, autoResize, isDataNoFuturo, limitLength } from '../../core/util-methods';
import {
  FORMAS_PAGAMENTO
} from '../../core/constans';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { AdminCredentialsDialogComponent } from '../shared/admin-credentials-dialog/admin-credentials-dialog.component';
import { UserService } from '../../core/user.service';
import { ColorUtils } from '../../core/color-utils';
import { Router } from '@angular/router';
import { AtendimentoService } from '../atendimento/atendimento.service';
import { AuthService } from '../auth/auth.service';
import { AgendamentoRascunhoService } from './agendamento-rascunho.service';
import { FilaEsperaService } from '../fila-espera/fila-espera.service';
import { FilaEspera, FilaEsperaRequest } from '../fila-espera/fila-espera.interface';

@Component({
  selector: 'app-agendamento-form',
  templateUrl: './agendamento-form.component.html',
  imports: [
    NgOptionComponent, NgSelectComponent,
    ReactiveFormsModule, NgClass,
    EmptyToNullDirective, NgxMaskDirective,
    PacienteFormComponent, NgNotFoundTemplateDirective,
    DatePipe, NgIf, NgFor, LucideAngularModule, ConfirmDialogComponent, AdminCredentialsDialogComponent, CurrencyPipe
  ]
})
export class AgendamentoFormComponent extends FormComponent<Agendamento, AgendamentoRequest> implements OnInit {
  @Input() agendamentoDetalhes: Agendamento | null = null;
  @Input() dataAgendamento: Date | null = null;
  @Input() pacienteId!: number | null;
  @Input() profissionalId: number | null = null;
  @Input() filaEspera: FilaEspera | null = null;

  titulo: string = 'Novo Agendamento';
  hoje: string;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  especialidadesFiltradas: Especialidade[] = [];
  profissionais: Profissional[] = [];
  profissionaisFiltrados: Profissional[] = [];
  empresas: Empresa[] = [];
  procedimentos: Procedimento[] = [];
  pacienteSelecionado?: Paciente | null;
  empresaSelecionada?: Empresa | null;
  convenioSelecionado?: Convenio | null;
  mostrarFormularioNovoPaciente: boolean = false;
  showTooltip: boolean = false;
  formasPagamento = FORMAS_PAGAMENTO;
  tipoAgendamento = TIPO_AGENDAMENTO;
  modoSalvar: boolean = true;
  exibeConfirmCancelamento: boolean = false;
  valorEditavel: boolean = false;
  valorAntesEdicao: number | null = null;
  descontoEditavel: boolean = false;
  descontoAntesEdicao: number | null = null;
  mostrarModalCredenciais: boolean = false;
  campoParaEditar: 'valor' | 'desconto' | null = null;
  mensagemModalCredenciais: string = '';
  valorTotalAgendamento: number = 0;
  quantiaFaltante: number = 0;
  isLoading: boolean = false;
  tipoPagamento: 'pago' | 'parcial' = 'pago';
  rascunhoCarregado: boolean = false;
  permissaoAdminValorConcedida: boolean = false;
  permissaoAdminDescontoConcedida: boolean = false;
  exibeConfirmNaoCompareceu: boolean = false;
  exibeConfirmExclusao: boolean = false;
  exibeConfirmCanceladoPeloUsuario: boolean = false;
  statusOptions: Array<{value: number, descricao: string, cor: string}> = [];

  protected readonly StatusAgendamento = StatusAgendamento;
  protected readonly StatusAgendamentoEnum = StatusAgendamentoEnum;
  protected readonly autoResize = autoResize;
  protected readonly limitLength = limitLength;

  get statusControl() {
    return this.form.get('status') as any;
  }

  constructor(protected override fb: FormBuilder, protected override toastr: ToastrService,
              private pacienteService: PacienteService, private convenioService: ConvenioService,
              private especialidadeService: EspecialidadeService, private profissionalService: ProfissionalService,
              private empresaService: EmpresaService, private procedimentoService: ProcedimentoService,
              protected userService: UserService, private router: Router,
              private atendimentoService: AtendimentoService, private authService: AuthService,
              private rascunhoService: AgendamentoRascunhoService, private filaEsperaService: FilaEsperaService,
              private agendamentoService: AgendamentoService) {
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
      procedimentoId: [null, {nonNullable: true}],
      convenioId: [null],
      empresaId: [null],
      formaPagamento: [null],
      valor: [null],
      desconto: [null],
      observacoes: [null],
      precoAlterado: [false],
      encaixe: [false],
      pago: [true],
      quantiaPaga: [null],
      filaEspera: [false],
      status: [null],
    };
    this.form = this.fb.group({
      ...form,
      procedimentos: this.fb.array([])
    });
  }

  override ngOnInit(): void {
    // Inicializa opções de status
    this.statusOptions = this.getStatusOptions();

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
      } else if (this.filaEspera) {
        // Preencher com dados da fila de espera
        this.carregarDadosFilaEspera(this.filaEspera);
      } else {
        // Desabilitar campos valor e desconto por padrão em novo agendamento
        this.form.get('valor')?.disable();
        this.form.get('desconto')?.disable();

        // Tentar carregar rascunho
        const rascunho = this.rascunhoService.carregarRascunho();
        if (rascunho && !this.pacienteId && !this.profissionalId) {
          this.carregarDadosRascunho(rascunho);
          this.rascunhoCarregado = true;
          this.toastr.info('Rascunho carregado');
        } else {
          if (this.pacienteId) {
            this.selectPaciente(this.pacienteId);
          }
          if (this.profissionalId) {
            this.selectProfissional(this.profissionalId);
          }
        }
      }
      this.isLoading = false;
      this.calcularValorTotal();
    });
  }

  carregarDadosRascunho(rascunho: any) {
    this.form.patchValue({
      pacienteId: rascunho.pacienteId,
      profissionalId: rascunho.profissionalId,
      empresaId: rascunho.empresaId,
      especialidadeId: rascunho.especialidadeId,
      convenioId: rascunho.convenioId,
      data: rascunho.data,
      hora: rascunho.horaInicio,
      duracao: rascunho.duracao,
      tipoAgendamento: rascunho.tipoAgendamento,
      procedimentoId: rascunho.procedimentoId,
      formaPagamento: rascunho.formaPagamento,
      valor: rascunho.valor,
      desconto: rascunho.desconto,
      observacoes: rascunho.observacoes,
      pago: rascunho.pago,
      quantiaPaga: rascunho.quantiaPaga,
      encaixe: rascunho.encaixe
    });

    // Atualizar seleções
    if (rascunho.pacienteId) {
      this.selectPaciente(rascunho.pacienteId);
    }
    if (rascunho.profissionalId) {
      this.selectProfissional(rascunho.profissionalId);
    }
    if (rascunho.empresaId) {
      const empresa = this.empresas.find(e => e.id === rascunho.empresaId);
      this.selectEmpresa(empresa || null);
    }
    if (rascunho.convenioId) {
      const convenio = this.convenios.find(c => c.id === rascunho.convenioId);
      this.selectConvenio(convenio || null);
    }
    if (rascunho.procedimentoId) {
      const procedimento = this.procedimentos.find(p => p.id === rascunho.procedimentoId);
      this.selectProcedimento(procedimento || null);
    }

    // Carregar procedimentos
    if (rascunho.procedimentos && rascunho.procedimentos.length > 0) {
      rascunho.procedimentos.forEach((proc: any) => {
        const procedimento = this.fb.group({
          quantidade: [proc.quantidade, [Validators.required, Validators.min(1)]],
          procedimentoId: [proc.procedimentoId, Validators.required],
          valor: [proc.valor],
          valorExibicao: [proc.valor]
        });
        this.procedimentosLancados.push(procedimento);
      });
    }

    // Atualizar tipo de pagamento
    this.tipoPagamento = rascunho.pago ? 'pago' : 'parcial';
  }

  carregarDadosFilaEspera(filaEspera: FilaEspera) {
    // Definir horário atual se não tiver no formulário
    const horaAtual = this.form.get('hora')?.value;
    if (!horaAtual) {
      const agora = new Date();
      const horas = String(agora.getHours()).padStart(2, '0');
      const minutos = String(agora.getMinutes()).padStart(2, '0');
      this.form.patchValue({ hora: `${horas}:${minutos}` });
    }

    // Preencher os campos disponíveis da fila de espera
    setTimeout(() => {
      this.form.patchValue({
        pacienteId: filaEspera.paciente.id,
        especialidadeId: filaEspera.especialidade.id,
        profissionalId: filaEspera.profissional?.id || null,
        convenioId: filaEspera.convenio?.id || null,
        empresaId: filaEspera.empresa?.id || null,
        procedimentoId: filaEspera.procedimento?.id || null,
        tipoAgendamento: filaEspera.tipoAgendamento ?? null,
        formaPagamento: filaEspera.formaPagamento ?? null,
        valor: filaEspera.valor || null,
        desconto: filaEspera.desconto || null,
        duracao: filaEspera.duracao || null,
        observacoes: filaEspera.observacoes || null
      });

      // Atualizar seleções
      this.selectPaciente(filaEspera.paciente.id);

      if (filaEspera.profissional?.id) {
        this.selectProfissional(filaEspera.profissional.id);
      }

      if (filaEspera.empresa) {
        this.selectEmpresa(filaEspera.empresa);
      }

      if (filaEspera.convenio) {
        this.selectConvenio(filaEspera.convenio);
      }

      if (filaEspera.procedimento) {
        this.selectProcedimento(filaEspera.procedimento);
      }
    }, 100);
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
        status: this.agendamentoDetalhes.status,
      });

      // Definir tipo de pagamento
      this.tipoPagamento = this.agendamentoDetalhes.pago ? 'pago' : 'parcial';

      // Carregar procedimentos
      if (this.agendamentoDetalhes.procedimentos && this.agendamentoDetalhes.procedimentos.length > 0) {
        this.agendamentoDetalhes.procedimentos.forEach(proc => {
          const procedimento = this.fb.group({
            quantidade: [proc.quantidade, [Validators.required, Validators.min(1)]],
            procedimentoId: [proc.procedimento.id, Validators.required],
            valor: [proc.valor ?? 0],
            valorExibicao: [proc.valor ?? 0]
          });
          this.procedimentosLancados.push(procedimento);
        });
      }

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
      tap(especialidades => {
        this.especialidades = especialidades;
        this.especialidadesFiltradas = especialidades;
      }));
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
      }));
  }

  fechar(confirmou: boolean = false) {
    if (!confirmou && this.form.dirty && !this.rascunhoCarregado) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }

  salvarRascunho() {
    const formValue = this.form.getRawValue();
    this.rascunhoService.salvarRascunho(formValue);
    this.rascunhoCarregado = true;
    this.form.markAsPristine();
    this.toastr.info('Rascunho salvo com sucesso');
    this.cancel.emit();
  }

  onEdit() {
    this.form.enable();
    this.form.get('pacienteId')?.disable();

    // Manter campos valor e desconto desabilitados até autorização admin
    if (!this.valorEditavel) {
      this.form.get('valor')?.disable();
    }
    if (!this.descontoEditavel) {
      this.form.get('desconto')?.disable();
    }

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
    this.calcularValorProcedimento(null);
    // Recalcular valores dos procedimentos quando a empresa mudar
    this.procedimentosLancados.controls.forEach((_, index) => {
      this.calcularValorProcedimento(index);
    });
  }

  selectProcedimento(procedimento: Procedimento | null) {
    this.calcularValorProcedimento(null);
    this.calcularDuracaoTotal();
  }

  selectProfissional(id: number | null) {
    const profissional = id ? [...this.profissionais.filter(p => p.id == id)].at(0) : null;
    this.form.patchValue({
      profissionalId: profissional ? profissional.id : null
    });

    // Filtrar especialidades de acordo com as especialidades do profissional selecionado
    if (profissional && profissional.especialidades && profissional.especialidades.length > 0) {
      this.especialidadesFiltradas = this.especialidades.filter(e =>
        profissional.especialidades?.some(pe => pe.id === e.id)
      );
    } else {
      this.especialidadesFiltradas = this.especialidades;
    }
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
    this.calcularValorProcedimento(null);
    // Recalcular valores dos procedimentos quando o convênio mudar
    this.procedimentosLancados.controls.forEach((_, index) => {
      this.calcularValorProcedimento(index);
    });
  }

  solicitarHabilitacaoValor() {
    if (this.permissaoAdminValorConcedida) {
      this.editaValor();
    } else {
      this.campoParaEditar = 'valor';
      this.mensagemModalCredenciais = 'Você precisa de aprovação de uma conta admin para editar o valor.';
      this.mostrarModalCredenciais = true;
    }
  }

  editaValor() {
    this.valorAntesEdicao = this.form.value.valor;
    this.valorEditavel = true;
    this.form.get('valor')?.enable();
    this.form.patchValue({
      precoAlterado: true
    });
    this.form.markAsPristine();
  }

  cancelarEdicaoValor() {
    this.valorEditavel = false;
    this.form.get('valor')?.disable();
    this.form.patchValue({
      valor: this.valorAntesEdicao,
      precoAlterado: false
    });
    this.valorAntesEdicao = null;
    this.calcularValorTotal();
  }

  solicitarHabilitacaoDesconto() {
    if (this.permissaoAdminDescontoConcedida) {
      this.editaDesconto();
    } else {
      this.campoParaEditar = 'desconto';
      this.mensagemModalCredenciais = 'Você precisa de aprovação de uma conta admin para editar o desconto.';
      this.mostrarModalCredenciais = true;
    }
  }

  editaDesconto() {
    this.descontoAntesEdicao = this.form.value.desconto;
    this.descontoEditavel = true;
    this.form.get('desconto')?.enable();
    this.form.markAsPristine();
  }

  cancelarModalCredenciais() {
    this.mostrarModalCredenciais = false;
    this.campoParaEditar = null;
  }

  validarCredenciaisAdmin(credenciais: { login: string, senha: string }) {
    this.authService.validarAdmin(credenciais.login, credenciais.senha).subscribe({
      next: (valido) => {
        if (valido) {
          if (this.campoParaEditar === 'valor') {
            this.permissaoAdminValorConcedida = true;
            this.editaValor();
            this.mostrarModalCredenciais = false;
            this.campoParaEditar = null;
            this.toastr.success('Valor habilitado para edição');
          } else if (this.campoParaEditar === 'desconto') {
            this.permissaoAdminDescontoConcedida = true;
            this.editaDesconto();
            this.mostrarModalCredenciais = false;
            this.campoParaEditar = null;
            this.toastr.success('Desconto habilitado para edição');
          }
        } else {
          this.toastr.error('Credenciais inválidas ou usuário não possui permissão de administrador');
        }
      },
      error: () => {
        this.toastr.error('Erro ao validar credenciais');
      }
    });
  }

  cancelarEdicaoDesconto() {
    this.descontoEditavel = false;
    this.form.get('desconto')?.disable();
    this.form.patchValue({
      desconto: this.descontoAntesEdicao
    });
    this.descontoAntesEdicao = null;
    this.calcularValorTotal();
  }

  podeAbrirAtendimento(agendamento: Agendamento | null): boolean {
    if (agendamento == null || !podeAbrirAtendimento(agendamento)) {
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
    if (this.form.value.desconto > this.form.value.valor) {
      this.toastr.warning('O desconto não pode ser maior do que o valor');
      return false;
    }

    return true;
  }

  override onSubmit() {
    const filaEspera = this.form.get('filaEspera')?.value;

    if (filaEspera) {
      // Salvar na fila de espera
      this.salvarFilaEspera();
    } else {
      // Salvar agendamento normal
      if (this.formValido()) {
        this.form.get('pacienteId')?.enable();
        // Limpar rascunho ao salvar definitivamente
        this.rascunhoService.limparRascunho();
        // Usar getRawValue() para incluir campos desabilitados (valor, desconto)
        this.save.emit(this.form.getRawValue());
      } else {
        Object.keys(this.form.controls).forEach(field => {
          const control = this.form.get(field);
          control?.markAsTouched({ onlySelf: true });
        });
      }
    }
  }

  salvarFilaEspera() {
    const pacienteId = this.form.get('pacienteId')?.value;
    const especialidadeId = this.form.get('especialidadeId')?.value;
    const observacoes = this.form.get('observacoes')?.value;

    if (!pacienteId) {
      this.toastr.error('Selecione um paciente');
      return;
    }

    if (!especialidadeId) {
      this.toastr.error('Selecione uma especialidade');
      return;
    }

    const filaEsperaRequest: FilaEsperaRequest = {
      pacienteId: pacienteId,
      especialidadeId: especialidadeId,
      observacoes: observacoes,
      // Campos opcionais do agendamento
      convenioId: this.form.get('convenioId')?.value,
      empresaId: this.form.get('empresaId')?.value,
      profissionalId: this.form.get('profissionalId')?.value,
      procedimentoId: this.form.get('procedimentoId')?.value,
      tipoAgendamento: this.form.get('tipoAgendamento')?.value,
      formaPagamento: this.form.get('formaPagamento')?.value,
      valor: this.form.get('valor')?.value,
      desconto: this.form.get('desconto')?.value,
      duracao: this.form.get('duracao')?.value
    };

    this.isLoading = true;
    this.filaEsperaService.criar(filaEsperaRequest).subscribe({
      next: () => {
        this.toastr.success('Paciente adicionado à fila de espera');
        this.rascunhoService.limparRascunho();
        this.cancel.emit();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  get procedimentosLancados() {
    return this.form.get('procedimentos') as FormArray;
  }

  adicionarProcedimento() {
    const procedimento = this.fb.group({
      quantidade: [1, [Validators.required, Validators.min(1)]],
      procedimentoId: [null, Validators.required],
      valor: [null],
      valorExibicao: [null],
    });

    this.procedimentosLancados.push(procedimento);
  }

  removerProcedimento(index: number) {
    this.procedimentosLancados.removeAt(index);
    this.calcularValorTotal();
    this.calcularDuracaoTotal();
  }

  calcularValorProcedimento(index: number | null) {
    const procedimentoPrincipal = (index == null);
    const procedimentoPrincipalSelecionado = this.form.get('procedimentoId')?.value;
    if (procedimentoPrincipal && !procedimentoPrincipalSelecionado) {
      this.form.patchValue({ valor: null });
      return;
    }

    const procedimentoControl = procedimentoPrincipal ? this.form : this.procedimentosLancados.at(index);
    const procedimentoId = procedimentoPrincipal ? procedimentoPrincipalSelecionado : procedimentoControl.get('procedimentoId')?.value;

    if (!procedimentoId) {
      return;
    }

    const convenioId = this.form.get('convenioId')?.value;
    const empresaId = this.form.get('empresaId')?.value;

    const definirValor = (valor: number | null) => {
      const valorFinal = valor ?? 0;
      procedimentoControl.patchValue({ valor: valorFinal, valorExibicao: valorFinal });
      this.calcularValorTotal();
    };

    const aplicarValorParticular = () => {
      this.procedimentoService.obterPrecoProcedimentoPadrao(procedimentoId).subscribe({
        next: response => definirValor(response?.preco ?? 0),
        error: () => definirValor(0)
      });
    };

    // Prioridade: Convênio > Plano Empresarial > Valor Particular
    if (convenioId) {
      this.procedimentoService.obterPrecoProcedimentoConvenio(procedimentoId, convenioId).subscribe({
        next: (response) => definirValor(response?.preco ?? 0),
        error: () => aplicarValorParticular()
      });
    } else if (empresaId && this.empresaSelecionada?.plano?.id) {
      this.procedimentoService.obterPrecoProcedimentoPlano(procedimentoId, this.empresaSelecionada.plano.id).subscribe({
        next: (response) => definirValor(response?.preco ?? 0),
        error: () => aplicarValorParticular()
      });
    } else {
      aplicarValorParticular();
    }
  }

  calcularValorTotal() {
    let total = this.form.get('valor')?.value || 0;
    const desconto = this.form.get('desconto')?.value || 0;

    this.procedimentosLancados.controls.forEach(control => {
      const quantidade = control.get('quantidade')?.value || 0;
      const valor = control.get('valor')?.value || 0;
      total += quantidade * valor;
    });

    this.valorTotalAgendamento = total - desconto;

    // Atualizar quantiaPaga se a opção "Pago" estiver selecionada
    if (this.tipoPagamento === 'pago') {
      this.form.patchValue({
        quantiaPaga: this.valorTotalAgendamento
      }, { emitEvent: false });
    }

    this.calcularQuantiaFaltante();
  }

  calcularQuantiaFaltante() {
    const quantiaPaga = this.form.get('quantiaPaga')?.value || 0;
    this.quantiaFaltante = Math.max(0, this.valorTotalAgendamento - quantiaPaga);
  }

  calcularDuracaoTotal() {
    // Só atualiza se o campo duração ainda não foi preenchido pelo usuário
    const duracaoAtual = this.form.get('duracao')?.value;
    if (duracaoAtual !== null && duracaoAtual !== undefined && duracaoAtual !== '') {
      return; // Não sobrescrever se já foi preenchido
    }

    let duracaoTotal = 0;

    // Adicionar duração do procedimento principal
    const procedimentoPrincipalId = this.form.get('procedimentoId')?.value;
    if (procedimentoPrincipalId) {
      const procedimentoPrincipal = this.procedimentos.find(p => p.id === procedimentoPrincipalId);
      if (procedimentoPrincipal?.duracao) {
        duracaoTotal += procedimentoPrincipal.duracao;
      }
    }

    // Adicionar duração dos procedimentos adicionais
    this.procedimentosLancados.controls.forEach(control => {
      const procedimentoId = control.get('procedimentoId')?.value;
      if (procedimentoId) {
        const procedimento = this.procedimentos.find(p => p.id === procedimentoId);
        if (procedimento?.duracao) {
          const quantidade = control.get('quantidade')?.value || 1;
          duracaoTotal += procedimento.duracao * quantidade;
        }
      }
    });

    // Atualizar o campo duração se houver valor calculado
    if (duracaoTotal > 0) {
      this.form.patchValue({
        duracao: duracaoTotal
      }, { emitEvent: false });
    }
  }

  alterouValor($event: Event) {
    this.calcularValorTotal();
    this.calcularQuantiaFaltante();
  }

  alterouDesconto($event: Event) {
    this.calcularValorTotal();
    this.calcularQuantiaFaltante();
  }

  selecionarTipoPagamento(tipo: 'pago' | 'parcial') {
    this.tipoPagamento = tipo;
    if (tipo === 'pago') {
      this.form.patchValue({
        pago: true,
        quantiaPaga: this.valorTotalAgendamento
      });
    } else {
      this.form.patchValue({
        pago: false,
        quantiaPaga: 0
      });
    }
  }

  marcarNaoCompareceu() {
    this.exibeConfirmNaoCompareceu = true;
  }

  confirmarNaoCompareceu() {
    if (!this.agendamentoDetalhes?.id) {
      return;
    }

    this.isLoading = true;
    this.agendamentoService.marcarNaoCompareceu(this.agendamentoDetalhes.id).subscribe({
      next: () => {
        this.toastr.success('Agendamento marcado como "Não Compareceu"');
        this.exibeConfirmNaoCompareceu = false;
        this.cancel.emit();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.exibeConfirmNaoCompareceu = false;
      }
    });
  }

  marcarCanceladoPeloUsuario() {
    this.exibeConfirmCanceladoPeloUsuario = true;
  }

  confirmarCanceladoPeloUsuario() {
    if (!this.agendamentoDetalhes?.id) {
      return;
    }

    this.isLoading = true;
    this.agendamentoService.marcarCanceladoPeloUsuario(this.agendamentoDetalhes.id).subscribe({
      next: () => {
        this.toastr.success('Agendamento marcado como "Cancelado Pelo Usuário"');
        this.exibeConfirmCanceladoPeloUsuario = false;
        this.cancel.emit();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.exibeConfirmCanceladoPeloUsuario = false;
      }
    });
  }

  excluirAgendamento() {
    this.exibeConfirmExclusao = true;
  }

  confirmarExclusao() {
    if (!this.agendamentoDetalhes?.id) {
      return;
    }

    this.isLoading = true;
    this.agendamentoService.excluir(this.agendamentoDetalhes.id).subscribe({
      next: () => {
        this.toastr.success('Agendamento excluído com sucesso');
        this.exibeConfirmExclusao = false;
        this.cancel.emit();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.exibeConfirmExclusao = false;
      }
    });
  }

  cancelarConfirmacao() {
    this.exibeConfirmNaoCompareceu = false;
    this.exibeConfirmExclusao = false;
    this.exibeConfirmCanceladoPeloUsuario = false;
  }

  getStatusOptions() {
    return Object.keys(StatusAgendamentoEnum)
      .filter(key => !isNaN(Number(key)))
      .map(key => ({
        value: Number(key) as StatusAgendamentoEnum,
        descricao: StatusAgendamento[Number(key) as StatusAgendamentoEnum].descricao,
        cor: StatusAgendamento[Number(key) as StatusAgendamentoEnum].cor
      }));
  }

  onStatusChange(statusValue: any) {
    if (statusValue && statusValue.value !== undefined) {
      this.form.patchValue({ status: statusValue.value });
    } else {
      this.form.patchValue({ status: statusValue });
    }
  }

  protected readonly ColorUtils = ColorUtils;
  protected readonly abrirDatePicker = abrirDatePicker;
}
