import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Procedimento, ProcedimentoRequest } from '../procedimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConveniosService } from '../../convenio/convenios.service';
import { Convenio } from '../../convenio/convenio.interface';

@Component({
  selector: 'app-procedimento-form',
  templateUrl: './procedimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective
  ]
})
export class ProcedimentoFormComponent implements OnInit {
  @Input() procedimento: Procedimento | null = null;
  @Output() save = new EventEmitter<Partial<ProcedimentoRequest>>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;
  convenios: Convenio[] = [];

  constructor(
    private fb: FormBuilder,
    private conveniosService: ConveniosService
  ) {
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      descricao: [null],
      valorPadrao: [0, [Validators.required, Validators.min(0)]],
      precosConvenios: this.fb.array([])
    });
  }

  ngOnInit() {
    this.loadConvenios();
    if (this.procedimento) {
      this.form.patchValue(this.procedimento);
      //TODO - dar patch nos preços também
    }
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

  onSubmit() {
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

  onCancel() {
    this.cancel.emit();
  }

  get isEditMode(): boolean {
    return !!this.procedimento;
  }

}
