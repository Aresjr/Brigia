import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Paciente } from '../paciente.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-paciente-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective],
  templateUrl: 'paciente-form.component.html'
})
export class PacienteFormComponent {
  @Output() save = new EventEmitter<Partial<Paciente>>();
  @Output() cancel = new EventEmitter<void>();

  pacienteForm: FormGroup;
  estados: ({ sigla: string; nome: string })[];

  constructor(private fb: FormBuilder,
              private http: HttpClient,
              private toastr: ToastrService) {
    this.pacienteForm = this.fb.group({
      nome: ['', Validators.required],
      email: [''],
      cpf: [''],
      dataNascimento: ['', Validators.required],
      sexo: [''],
      celular: [''],
      cep: [''],
      rua: [''],
      complemento: [''],
      bairro: [''],
      cidade: [''],
      uf: ['', [Validators.minLength(2), Validators.maxLength(2)]],
      corIdentificacao: [''],
    });
    this.estados = [
      { sigla: 'AC', nome: 'Acre' },
      { sigla: 'AL', nome: 'Alagoas' },
      { sigla: 'AP', nome: 'Amapá' },
      { sigla: 'AM', nome: 'Amazonas' },
      { sigla: 'BA', nome: 'Bahia' },
      { sigla: 'CE', nome: 'Ceará' },
      { sigla: 'DF', nome: 'Distrito Federal' },
      { sigla: 'ES', nome: 'Espírito Santo' },
      { sigla: 'GO', nome: 'Goiás' },
      { sigla: 'MA', nome: 'Maranhão' },
      { sigla: 'MT', nome: 'Mato Grosso' },
      { sigla: 'MS', nome: 'Mato Grosso do Sul' },
      { sigla: 'MG', nome: 'Minas Gerais' },
      { sigla: 'PA', nome: 'Pará' },
      { sigla: 'PB', nome: 'Paraíba' },
      { sigla: 'PR', nome: 'Paraná' },
      { sigla: 'PE', nome: 'Pernambuco' },
      { sigla: 'PI', nome: 'Piauí' },
      { sigla: 'RJ', nome: 'Rio de Janeiro' },
      { sigla: 'RN', nome: 'Rio Grande do Norte' },
      { sigla: 'RS', nome: 'Rio Grande do Sul' },
      { sigla: 'RO', nome: 'Rondônia' },
      { sigla: 'RR', nome: 'Roraima' },
      { sigla: 'SC', nome: 'Santa Catarina' },
      { sigla: 'SP', nome: 'São Paulo' },
      { sigla: 'SE', nome: 'Sergipe' },
      { sigla: 'TO', nome: 'Tocantins' }
    ];
  }

  onSubmit() {
    if (this.pacienteForm.valid) {
      this.save.emit(this.pacienteForm.value);
    } else {
      Object.keys(this.pacienteForm.controls).forEach(field => {
        const control = this.pacienteForm.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  buscarCep() {
    const cep = this.pacienteForm.get('cep')?.value?.replace(/\D/g, '');
    if (cep?.length === 8) {
      this.http.get<any>(`https://viacep.com.br/ws/${cep}/json/`)
        .subscribe((data) => {
          if (!data.erro) {
            this.pacienteForm.patchValue({
              rua: data.logradouro,
              bairro: data.bairro,
              cidade: data.localidade,
              uf: data.uf
            });
          } else {
            this.toastr.warning('CEP não encontrado');
            console.info('CEP não encontrado', data.erro);
          }
        });
    }
  }
}
