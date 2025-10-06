import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import {
  Procedimento,
  ProcedimentoRequest
} from '../procedimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConvenioService } from '../../convenio/convenio.service';
import { Convenio } from '../../convenio/convenio.interface';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { EmpresaPlano } from '../../empresa/empresa.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { FormComponent } from '../../shared/form.component';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ToastrService } from 'ngx-toastr';
import { TIPO_AGENDAMENTO } from '../../../core/constans';
import { EmpresaService } from '../../empresa/empresa.service';

@Component({
  selector: 'app-procedimento-form',
  templateUrl: './procedimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective,
    NgNotFoundTemplateDirective,
    NgOptionComponent,
    NgSelectComponent
  ]
})
export class ProcedimentoFormComponent extends FormComponent<Procedimento, ProcedimentoRequest> implements OnInit {

  convenios: Convenio[] = [];
  planos: EmpresaPlano[] = [];
  especialidades: Especialidade[] = [];
  TIPO_AGENDAMENTO = TIPO_AGENDAMENTO;

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private convenioService: ConvenioService,
    private especialidadeService: EspecialidadeService,
    private empresaService: EmpresaService
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      observacoes: [null],
      especialidadeId: [null, [Validators.required]],
      valorPadrao: [0, [Validators.required, Validators.min(0)]],
      valorRepasse: [0, [Validators.min(0)]],
      duracao: [null, [Validators.min(1), Validators.max(999)]],
      tipo: [null, [Validators.required]],
      precosConvenios: this.fb.array([]),
      precosPlanos: this.fb.array([])
    });
  }

  override ngOnInit() {
    const chamadas:Observable<any[]>[] = [
      this.loadConvenios(),
      this.loadEspecialidades(),
      this.loadPlanos()
    ];
    forkJoin(chamadas).subscribe(() => {
      if (this.registro) {
        this.form.patchValue(this.registro);
        this.form.patchValue({
          especialidadeId: this.registro.especialidade.id
        });
        this.precosConvenios.controls.forEach(control => {
          const convenioId = control.value.convenioId;
          const precoProcedimento = this.registro?.precosProcedimento
            ?.find(pp => pp.convenio.id === convenioId);

          if (precoProcedimento) {
            control.patchValue({
              preco: precoProcedimento.preco,
              repasse: precoProcedimento.repasse,
            });
          }
        });
        // TODO: Carregar preços por plano quando existir no backend
      }
    });
  }

  private loadEspecialidades(): Observable<Especialidade[]> {
    return this.especialidadeService.listar()
      .pipe(
        map(response => response.items),
        tap(especialidades => {
          this.especialidades = especialidades
        })
      );
  }

  private loadConvenios(): Observable<Convenio[]> {
    return this.convenioService.listar()
      .pipe(
        map(response => response.items),
        tap(convenios => {
          this.convenios = convenios;
          this.initializePrecosConvenios();
        })
      );
  }

  private loadPlanos(): Observable<EmpresaPlano[]> {
    return this.empresaService.getPlanos()
      .pipe(
        map(response => response.items),
        tap(planos => {
          this.planos = planos;
          this.initializePrecosPlanos();
        })
      );
  }

  private initializePrecosConvenios() {
    const precosArray = this.form.get('precosConvenios') as FormArray;
    precosArray.clear();

    this.convenios.forEach(convenio => {
      precosArray.push(this.fb.group({
        convenioId: [convenio.id],
        nome: [convenio.nome],
        preco: [0, [Validators.required, Validators.min(0)]],
        repasse: [0]
      }));
    });
  }

  private initializePrecosPlanos() {
    const precosArray = this.form.get('precosPlanos') as FormArray;
    precosArray.clear();

    this.planos.forEach(plano => {
      precosArray.push(this.fb.group({
        planoId: [plano.id],
        nome: [plano.nome],
        preco: [0, [Validators.required, Validators.min(0)]],
        repasse: [0]
      }));
    });
  }

  get precosConvenios() {
    return this.form.get('precosConvenios') as FormArray;
  }

  get precosPlanos() {
    return this.form.get('precosPlanos') as FormArray;
  }

  override onSubmit() {
    if (this.form.valid) {
      const formValue = this.form.value;
      const precosConvenios = formValue.precosConvenios.map((p: any) => ({
        convenioId: p.convenioId,
        preco: p.preco,
        repasse: p.repasse,
        unidade: null
      }));

      const precosPlanos = formValue.precosPlanos.map((p: any) => ({
        planoId: p.planoId,
        preco: p.preco,
        repasse: p.repasse
      }));

      this.save.emit({
        ...formValue,
        precosConvenios: precosConvenios,
        precosPlanos: precosPlanos
      });
    } else {
      this.toastr.warning('Alguns campos não foram preenchidos, verifique');
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  protected readonly limitLength = limitLength;
}
