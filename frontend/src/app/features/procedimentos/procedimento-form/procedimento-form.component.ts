import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Procedimento, ProcedimentoRequest } from '../procedimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConveniosService } from '../../convenio/convenios.service';
import { Convenio } from '../../convenio/convenio.interface';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { FormComponent } from '../../shared/form.component';

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

  constructor(
    protected override fb: FormBuilder,
    private conveniosService: ConveniosService,
    private especialidadeService: EspecialidadeService
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
    this.loadConvenios();
    this.loadEspecialidades();
    if (this.procedimento) {
      this.form.patchValue(this.procedimento);
    }
  }

  private loadEspecialidades() {
    this.especialidadeService.listar().subscribe(response => {
      this.especialidades = response.items;
    });
  }

  private loadConvenios() {
    this.conveniosService.listar().subscribe(response => {
      this.convenios = response.items;
      this.initializePrecosConvenios();
    });
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
