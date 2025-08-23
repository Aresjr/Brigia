import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Paciente } from '../paciente.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { ESTADOS, SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConveniosService } from '../../convenio/convenios.service';
import { Convenio } from '../../convenio/convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';

@Component({
  selector: 'app-paciente-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, LucideAngularModule, NgOptionComponent, NgSelectComponent],
  templateUrl: 'paciente-form.component.html'
})
export class PacienteFormComponent implements OnInit {
  @Input() paciente?: Paciente | null;
  @Output() save = new EventEmitter<Partial<Paciente>>();
  @Output() cancel = new EventEmitter<void>();

  pacienteForm: FormGroup;
  estados: ({ sigla: string; nome: string })[] = ESTADOS;
  protected readonly SEXOS = SEXOS;
  convenios: Convenio[] = [];

  constructor(
    private fb: FormBuilder,
    private http: HttpClient,
    private toastr: ToastrService,
    private conveniosService: ConveniosService
  ) {
    this.pacienteForm = this.fb.group({
      nome: [null, Validators.required],
      email: [null],
      cpf: [null],
      dataNascimento: [null, Validators.required],
      sexo: [null],
      celular: [null],
      cep: [null],
      rua: [null],
      complemento: [null],
      bairro: [null],
      cidade: [null],
      uf: [null, [Validators.minLength(2), Validators.maxLength(2)]],
      corIdentificacao: [null],
      convenioId: [null],
      empresaId: [null]
    });
  }

  ngOnInit() {
    if (this.paciente) {
      this.pacienteForm.patchValue(this.paciente);
      if (this.paciente.convenio) {
        this.pacienteForm.patchValue({
          convenioId: this.paciente.convenio.id
        });
      }
    }

    this.carregarConvenios();
  }

  private carregarConvenios() {
    this.conveniosService.listar().subscribe(
      response => {
        this.convenios = response.items;
      }
    );
  }

  get isEditMode(): boolean {
    return !!this.paciente;
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
