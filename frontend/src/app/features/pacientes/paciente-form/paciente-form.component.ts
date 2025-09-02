import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Paciente, PacienteRequest } from '../paciente.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { ESTADOS, SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConveniosService } from '../../convenio/convenios.service';
import { Convenio } from '../../convenio/convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { EmpresasService } from '../../empresa/empresas.service';
import { Empresa } from '../../empresa/empresa.interface';
import { FormComponent } from '../../shared/form.component';

@Component({
  selector: 'app-paciente-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, LucideAngularModule, NgOptionComponent, NgSelectComponent],
  templateUrl: 'paciente-form.component.html'
})
export class PacienteFormComponent extends FormComponent implements OnInit {
  @Input() paciente?: Paciente | null;
  @Output() save = new EventEmitter<Partial<PacienteRequest>>();
  @Output() cancel = new EventEmitter<void>();

  estados: ({ sigla: string; nome: string })[] = ESTADOS;
  protected readonly SEXOS = SEXOS;
  convenios: Convenio[] = [];
  empresas: Empresa[] = [];

  constructor(
    protected override fb: FormBuilder,
    private http: HttpClient,
    private toastr: ToastrService,
    private conveniosService: ConveniosService,
    private empresasService: EmpresasService
  ) {
    super(fb);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null], cpf: [null],
      dataNascimento: [null, Validators.required],
      sexo: [null], celular: [null], cep: [null],
      rua: [null], complemento: [null], bairro: [null],
      cidade: [null],
      uf: [null, [Validators.minLength(2), Validators.maxLength(2)]],
      corIdentificacao: [null], convenioId: [null], empresaId: [null]
    });
  }

  ngOnInit() {
    this.carregarConvenios();
    this.carregarEmpresas();

    if (this.paciente) {
      this.form.patchValue(this.paciente);
    }
  }

  private carregarConvenios() {
    this.conveniosService.listar().subscribe(
      response => {
        this.convenios = response.items;
        this.form.patchValue({
          convenioId: this.paciente?.convenio?.id,
        });
      }
    );
  }

  private carregarEmpresas() {
    this.empresasService.listar().subscribe(
      response => {
        this.empresas = response.items;
        this.form.patchValue({
          empresaId: this.paciente?.empresa?.id,
        });
      }
    );
  }

  get isEditMode(): boolean {
    return !!this.paciente;
  }

  onSubmit() {
    if (this.form.valid) {
      this.save.emit(this.form.value);
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

  buscarCep() {
    const cep = this.form.get('cep')?.value?.replace(/\D/g, '');
    if (cep?.length === 8) {
      this.http.get<any>(`https://viacep.com.br/ws/${cep}/json/`)
        .subscribe((data) => {
          if (!data.erro) {
            this.form.patchValue({
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
