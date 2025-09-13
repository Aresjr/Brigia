import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import {
  PrecoProcedimentoConvenio,
  Procedimento,
  ProcedimentoRequest
} from '../procedimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConveniosService } from '../../convenio/convenios.service';
import { Convenio } from '../../convenio/convenio.interface';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { FormComponent } from '../../shared/form.component';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ProcedimentosService } from '../procedimentos.service';

@Component({
  selector: 'app-procedimento-form',
  templateUrl: './procedimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective
  ]
})
export class ProcedimentoFormComponent extends FormComponent<ProcedimentoRequest> implements OnInit {
  @Input() procedimento: Procedimento | null = null;

  convenios: Convenio[] = [];
  especialidades: Especialidade[] = [];
  precosProcedimento: PrecoProcedimentoConvenio[] | null = null;

  constructor(
    protected override fb: FormBuilder,
    private conveniosService: ConveniosService,
    private especialidadeService: EspecialidadeService,
    private procedimentosService: ProcedimentosService
  ) {
    super(fb);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      observacoes: [null],
      especialidadeId: [null, [Validators.required]],
      valorPadrao: [0, [Validators.required, Validators.min(0)]],
      precosConvenios: this.fb.array([])
    });
  }

  ngOnInit() {
    const chamadas:Observable<any[]>[] = [
      this.loadConvenios(),
      this.loadEspecialidades()
    ];
    if (this.procedimento) {
      chamadas.push(this.loadPrecosProcedimento(this.procedimento.id));
    }
    forkJoin(chamadas).subscribe(() => {
      if (this.procedimento) {
        console.log('precosProcedimento', this.precosProcedimento);
        this.form.patchValue(this.procedimento);
        this.form.patchValue({
          especialidadeId: this.procedimento.especialidade.id
        });
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
    return this.conveniosService.listar()
      .pipe(
        map(response => response.items),
        tap(convenios => {
          this.convenios = convenios;
          this.initializePrecosConvenios();
        })
      );
  }

  private loadPrecosProcedimento(procedimentoId: number): Observable<PrecoProcedimentoConvenio[]> {
    return this.procedimentosService.listarPrecosProcedimento(procedimentoId)
      .pipe(
        map(response => response.tabelaConvenio),
        tap(precosProcedimento => {
          this.precosProcedimento = precosProcedimento;
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
        repasse: [0, [Validators.required, Validators.min(0)]]
      }));
    });
  }

  get precosConvenios() {
    return this.form.get('precosConvenios') as FormArray;
  }

  override onSubmit() {
    if (this.form.valid) {
      const formValue = this.form.value;
      const precos = formValue.precosConvenios.map((p: any) => ({
        convenioId: p.convenioId,
        preco: p.preco,
        repasse: p.repasse,
        unidade: null
      }));

      this.save.emit({
        ...formValue,
        precosConvenios: precos
      });
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  get isEditMode(): boolean {
    return !!this.procedimento;
  }

  protected readonly limitLength = limitLength;
}
