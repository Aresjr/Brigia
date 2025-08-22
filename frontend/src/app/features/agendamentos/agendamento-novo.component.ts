import { Component, EventEmitter, Output } from '@angular/core';
import { Paciente } from '../pacientes/paciente.interface';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { PacienteService } from '../pacientes/paciente.service';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ConveniosService } from '../convenio/convenios.service';
import { Convenio } from '../convenio/convenio.interface';

@Component({
  selector: 'app-agendamento-novo',
  templateUrl: './agendamento-novo.component.html',
  imports: [
    NgOptionComponent,
    NgSelectComponent,
    ReactiveFormsModule
  ]
})
export class AgendamentoNovoComponent {
  @Output() confirm = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  agendamentoForm: FormGroup;
  pacientes: Paciente[] = [];
  convenios: Convenio[] = [];
  pacienteSelecionado?: Paciente;

  constructor(private fb: FormBuilder, private pacientesService: PacienteService,
              private conveniosService: ConveniosService) {
    this.carregarPacientes();
    this.carregarConvenios();
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
    this.conveniosService.listar(true).subscribe({
      next: (response) => {
        this.convenios = response.items;
      }
    });
  }

  onConfirm() {

    console.log(this.agendamentoForm.get('pacienteId')?.invalid);
    console.log(this.agendamentoForm.get('pacienteId')?.touched);

    this.confirm.emit();
  }

  onCancel() {
    this.cancel.emit();
  }

  selectPaciente($event: Paciente) {
    this.pacienteSelecionado = $event;
  }
}
