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

@Component({
  selector: 'app-agendamento-novo',
  templateUrl: './agendamento-novo.component.html',
  imports: [
    NgOptionComponent,
    NgSelectComponent,
    ReactiveFormsModule
  ]
})
export class AgendamentoNovoComponent implements OnInit {
  @Output() confirm = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  agendamentoForm: FormGroup;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  profissionais: Profissional[] = [];
  pacienteSelecionado?: Paciente;

  constructor(private fb: FormBuilder, private pacientesService: PacienteService,
              private conveniosService: ConveniosService, private especialidadeService: EspecialidadeService,
              private profissionaisService: ProfissionaisService) {
    this.agendamentoForm = this.fb.group({
      pacienteId: [null, Validators.required],
      convenioId: [null, Validators.required],
      data: ['', Validators.required],
      hora: ['', Validators.required],
      observacoes: ['']
    });
  }

  ngOnInit(): void {
    this.carregarPacientes();
    this.carregarConvenios();
    this.carregarEspecialidades();
    this.carregarProfissionais();
    this.agendamentoForm = this.fb.group({
      pacienteId: [null, Validators.required],
      convenioId: [null, Validators.required],
      data: ['', Validators.required],
      hora: ['', Validators.required],
      observacoes: ['']
    });
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

  onConfirm() {
    this.confirm.emit();
  }

  onCancel() {
    this.cancel.emit();
  }

  selectPaciente($event: Paciente) {
    this.pacienteSelecionado = $event;
    if (this.pacienteSelecionado.convenio) {
      this.agendamentoForm.patchValue({
        convenioId: this.pacienteSelecionado.convenio.id
      });
    }
  }
}
