import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConveniosService } from '../convenio/convenios.service';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { ProfissionaisService } from '../profissionais/profissionais.service';
import { NgClass, NgIf } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresasService } from '../empresa/empresas.service';
import { PacienteFormComponent } from '../pacientes/paciente-form/paciente-form.component';
import { ToastrService } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { ProcedimentosService } from '../procedimentos/procedimentos.service';

@Component({
  selector: 'app-agendamento-novo',
  templateUrl: './agendamento-novo.component.html',
  imports: [
    NgOptionComponent,
    NgSelectComponent,
    ReactiveFormsModule,
    NgClass,
    EmptyToNullDirective,
    NgxMaskDirective,
    PacienteFormComponent,
    NgNotFoundTemplateDirective,
    LucideAngularModule,
    NgIf
  ]
})
export class AgendamentoNovoComponent implements OnInit {
  @Output() confirm = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  profissionais: Profissional[] = [];
  empresas: Empresa[] = [];
  procedimentos: Procedimento[] = [];
  pacienteSelecionado?: Paciente;
  empresaSelecionada?: Empresa | null;
  especialidadeSelecionada?: Especialidade | null;
  mostrarFormularioNovoPaciente: boolean = false;

  constructor(private fb: FormBuilder, private pacientesService: PacienteService, private toastr: ToastrService,
              private conveniosService: ConveniosService, private especialidadeService: EspecialidadeService,
              private profissionaisService: ProfissionaisService, private empresasService: EmpresasService,
              private procedimentosService: ProcedimentosService) {
    const hoje = new Date().toISOString().split('T')[0];
    this.form = this.fb.group({
      pacienteId: [null, Validators.required],
      convenioId: [null, Validators.required],
      empresaId: [null, Validators.required],
      especialidadeId: [null, Validators.required],
      profissionalId: [null, Validators.required],
      procedimentoId: [null, Validators.required],
      data: [hoje, Validators.required],
      hora: ['', Validators.required],
      observacoes: ['']
    });
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
    this.confirm.emit();
  }

  onCancel() {
    this.cancel.emit();
  }

  selectPaciente(paciente: Paciente) {
    this.pacienteSelecionado = paciente;
    this.form.patchValue({
      pacienteId: this.pacienteSelecionado.id,
      convenioId: this.pacienteSelecionado.convenio?.id,
      empresaId: this.pacienteSelecionado.empresa?.id
    });
    this.selectEmpresa(this.pacienteSelecionado?.empresa?.id);
  }

  selectEmpresa(id: number | undefined) {
    if (id) {
      this.empresaSelecionada = [...this.empresas.filter(e => e.id === id)].at(0);
    } else {
      this.empresaSelecionada = null;
    }
  }

  onSalvarNovoPaciente(paciente: Partial<Paciente>) {
    this.pacientesService.criar(paciente).subscribe({
      next: (paciente) => {
        this.toastr.success('Paciente cadastrado');
        this.carregarPacientes();
        this.mostrarFormularioNovoPaciente = false;
        this.selectPaciente(paciente);
      }
    });
  }

  profissionaisFiltrados(): Profissional[] {
    if (this.especialidadeSelecionada != null) {
      return [...this.profissionais.filter(e => e.especialidades?.includes(<Especialidade>this.especialidadeSelecionada))];
    }
    return [...this.profissionais];
  }

  onCancelarNovo() {
    this.mostrarFormularioNovoPaciente = false;
  }

  selectEspecialidade(id: any) {
    if (id) {
      this.especialidadeSelecionada = [...this.especialidades.filter(e => e.id === id)].at(0);
    } else {
      this.empresaSelecionada = null;
    }
  }
}
