import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Profissional } from '../profissional.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';

@Component({
  selector: 'app-profissional-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective],
  templateUrl: 'profissional-form.component.html'
})
export class ProfissionalFormComponent implements OnInit {
  @Input() profissional?: Profissional | null;
  @Output() save = new EventEmitter<Partial<Profissional>>();
  @Output() cancel = new EventEmitter<void>();

  profissionalForm: FormGroup;
  protected readonly SEXOS = SEXOS;

  constructor(private fb: FormBuilder,
              private http: HttpClient,
              private toastr: ToastrService) {
    this.profissionalForm = this.fb.group({
      nome: [null, Validators.required],
      email: [null],
      cpf: [null],
      dataNascimento: [null, Validators.required],
      sexo: [null],
      celular: [null],
      crm: [null]
      //TODO - adicionar Especialidades
    });
  }

  ngOnInit() {
    if (this.profissional) {
      this.profissionalForm.patchValue(this.profissional);
    }
  }

  get isEditMode(): boolean {
    return !!this.profissional;
  }

  onSubmit() {
    if (this.profissionalForm.valid) {
      this.save.emit(this.profissionalForm.value);
    } else {
      Object.keys(this.profissionalForm.controls).forEach(field => {
        const control = this.profissionalForm.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  buscarCep() {
    const cep = this.profissionalForm.get('cep')?.value?.replace(/\D/g, '');
    if (cep?.length === 8) {
      this.http.get<any>(`https://viacep.com.br/ws/${cep}/json/`)
        .subscribe((data) => {
          if (!data.erro) {
            this.profissionalForm.patchValue({
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
