import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConveniosService } from '../convenio/convenios.service';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { EspecialidadeService } from '../especialidade/especialidade.service';
import { ProfissionaisService } from '../profissionais/profissionais.service';
import { NgClass } from '@angular/common';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { Empresa } from '../empresa/empresa.interface';
import { EmpresasService } from '../empresa/empresas.service';

@Component({
  selector: 'app-agendamento-novo',
  templateUrl: './agendamento-novo.component.html',
  imports: [
    NgOptionComponent,
    NgSelectComponent,
    ReactiveFormsModule,
    NgClass,
    EmptyToNullDirective,
    NgxMaskDirective
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
  pacienteSelecionado?: Paciente;

  constructor(private fb: FormBuilder, private pacientesService: PacienteService,
              private conveniosService: ConveniosService, private especialidadeService: EspecialidadeService,
              private profissionaisService: ProfissionaisService, private empresasService: EmpresasService) {
    this.form = this.fb.group({
      pacienteId: [null, Validators.required],
      convenioId: [null, Validators.required],
      empresaId: [null, Validators.required],
      especialidadeId: [null, Validators.required],
      profissionalId: [null, Validators.required],
      data: ['', Validators.required],
      hora: ['', Validators.required],
      observacoes: ['']
    });
  }

  ngOnInit(): void {
    const hoje = new Date().toISOString().split('T')[0];
    this.form = this.fb.group({
      pacienteId: [null, Validators.required],
      convenioId: [null, Validators.required],
      data: [hoje, Validators.required],
      hora: ['', Validators.required],
      observacoes: ['']
    });

    this.carregarPacientes();
    this.carregarConvenios();
    this.carregarEspecialidades();
    this.carregarProfissionais();
    this.carregarEmpresas();
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

  onConfirm() {
    this.confirm.emit();
  }

  onCancel() {
    this.cancel.emit();
  }

  selectPaciente($event: Paciente) {
    this.pacienteSelecionado = $event;
    if (this.pacienteSelecionado.convenio) {
      // this.form.patchValue({
      //   convenioId: this.pacienteSelecionado.convenio.id,
      //   empresaId: this.pacienteSelecionado.empresa?.id
      // });
    }
  }
}
