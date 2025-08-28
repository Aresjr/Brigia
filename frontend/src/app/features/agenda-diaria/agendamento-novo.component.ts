import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
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
import { AgendamentoRequest } from './agendamento.interface';
import { IForm } from '../shared/form.interface';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-agendamento-novo',
  templateUrl: './agendamento-novo.component.html',
  imports: [
    NgOptionComponent, NgSelectComponent,
    ReactiveFormsModule, NgClass,
    EmptyToNullDirective, NgxMaskDirective,
    PacienteFormComponent, NgNotFoundTemplateDirective,
    DatePipe, NgIf, LucideAngularModule
  ]
})
export class AgendamentoNovoComponent extends FormComponent implements OnInit {
  @Output() confirm = new EventEmitter<Partial<AgendamentoRequest>>();
  @Output() cancel = new EventEmitter<void>();

  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  profissionais: Profissional[] = [];
  empresas: Empresa[] = [];
  procedimentos: Procedimento[] = [];
  pacienteSelecionado?: Paciente | null;
  empresaSelecionada?: Empresa | null;
  especialidadeSelecionada?: Especialidade | null;
  mostrarFormularioNovoPaciente: boolean = false;

  constructor(protected override fb: FormBuilder, private pacientesService: PacienteService, private toastr: ToastrService,
              private conveniosService: ConveniosService, private especialidadeService: EspecialidadeService,
              private profissionaisService: ProfissionaisService, private empresasService: EmpresasService,
              private procedimentosService: ProcedimentosService) {
    super(fb);

    const hoje = new Date().toISOString().split('T')[0];
    const form: IForm<AgendamentoRequest> = {
      pacienteId: [null, {nonNullable: true}],
      data: [hoje, {nonNullable: true}],
      hora: [null, {nonNullable: true}],
      profissionalId: [null, {nonNullable: true}],
      especialidadeId: [null, {nonNullable: true}],
      procedimentoId: [null],
      convenioId: [null],
      empresaId: [null],
      observacoes: [null]
    };
    this.form = this.fb.group(form);
  }

  ngOnInit(): void {
    this.carregarPacientes();
    this.carregarConvenios();
    this.carregarEspecialidades();
    this.carregarProfissionais();
    this.carregarEmpresas();
    this.carregarProcedimentos();
  }

  carregarPacientes(): void {
    this.pacientesService.listar().subscribe({
      next: (response) => {
        this.pacientes = response.items;
      }
    });
  }

  carregarConvenios(): void {
    this.conveniosService.listar().subscribe({
      next: (response) => {
        this.convenios = response.items;
      }
    });
  }

  carregarEspecialidades(): void {
    this.especialidadeService.listar().subscribe({
      next: (response) => {
        this.especialidades = response.items;
      }
    });
  }

  carregarProfissionais(): void {
    this.profissionaisService.listar().subscribe({
      next: (response) => {
        this.profissionais = response.items;
      }
    });
  }

  carregarEmpresas(): void {
    this.empresasService.listar().subscribe({
      next: (response) => {
        this.empresas = response.items;
      }
    });
  }

  carregarProcedimentos(): void {
    this.procedimentosService.listar().subscribe({
      next: (response) => {
        this.procedimentos = response.items;
      }
    });
  }

  onConfirm() {
    if (this.form.valid) {
      this.confirm.emit(this.form.value);
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  onCancel() {
    this.cancel.emit();
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
}
