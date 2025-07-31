import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Paciente } from '../paciente.interface';

@Component({
  selector: 'app-paciente-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: 'paciente-form.component.html'
})
export class PacienteFormComponent {
  @Output() save = new EventEmitter<Partial<Paciente>>();
  @Output() cancel = new EventEmitter<void>();

  pacienteForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.pacienteForm = this.fb.group({
      nome: ['', Validators.required],
      email: [''],
      cpf: ['', Validators.required],
      dataNascimento: ['', Validators.required],
      sexo: ['', Validators.required],
      celular: [''],
      cep: [''],
      rua: [''],
      complemento: [''],
      bairro: [''],
      cidade: [''],
      uf: ['', [Validators.minLength(2), Validators.maxLength(2)]],
      corIdentificacao: ['#' + Math.floor(Math.random()*16777215).toString(16)], // Cor aleatória
    });
  }

  onSubmit() {
    console.log(this.pacienteForm.valid);
    if (this.pacienteForm.valid) {
      this.save.emit(this.pacienteForm.value);
    } else {
      console.error('Formulário inválido', this.pacienteForm.errors);
      // Aqui você pode exibir uma mensagem de erro para o usuário
      // ou destacar os campos inválidos no formulário.
    }
  }

  onCancel() {
    this.cancel.emit();
  }
}
