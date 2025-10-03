import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators } from '@angular/forms';
import { Paciente, PacienteRequest } from '../paciente.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { HttpClient } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { ESTADOS, SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConvenioService } from '../../convenio/convenio.service';
import { Convenio } from '../../convenio/convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { EmpresaService } from '../../empresa/empresa.service';
import { Empresa } from '../../empresa/empresa.interface';
import { FormComponent } from '../../shared/form.component';

@Component({
  selector: 'app-paciente-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, LucideAngularModule, NgOptionComponent, NgSelectComponent, NgNotFoundTemplateDirective],
  templateUrl: 'paciente-form.component.html'
})
export class PacienteFormComponent extends FormComponent<Paciente, PacienteRequest> implements OnInit {
  @Input() paciente?: Paciente | null;
  @Input() isDetalhes: boolean = false;

  estados: ({ sigla: string; nome: string })[] = ESTADOS;
  protected readonly SEXOS = SEXOS;
  convenios: Convenio[] = [];
  empresas: Empresa[] = [];

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private http: HttpClient,
    private convenioService: ConvenioService,
    private empresaService: EmpresaService
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null], cpf: [null],
      dataNascimento: [null, Validators.required],
      nomeSocial: [null], pressaoArterial: [null],
      sexo: [null], celular: [null], cep: [null],
      rua: [null], complemento: [null], bairro: [null],
      cidade: [null],
      uf: [null, [Validators.minLength(2), Validators.maxLength(2)]],
      corIdentificacao: [null], convenioId: [null], empresaId: [null]
    });
  }

  override ngOnInit() {
    this.carregarConvenios();
    this.carregarEmpresas();

    if (this.paciente) {
      this.form.patchValue(this.paciente);
    }
    if (this.isDetalhes) {

    }
  }

  private carregarConvenios() {
    this.convenioService.listar().subscribe(
      response => {
        this.convenios = response.items;
        this.form.patchValue({
          convenioId: this.paciente?.convenio?.id,
        });
      }
    );
  }

  private carregarEmpresas() {
    this.empresaService.listar().subscribe(
      response => {
        this.empresas = response.items;
        this.form.patchValue({
          empresaId: this.paciente?.empresa?.id,
        });
      }
    );
  }

  buscarCep() { //TODO - colocar em um service separado
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
