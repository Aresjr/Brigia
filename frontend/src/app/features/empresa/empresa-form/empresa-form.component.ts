import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Empresa, EmpresaRequest } from '../empresa.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';

@Component({
  selector: 'app-empresa-form',
  templateUrl: './empresa-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective
  ]
})
export class EmpresaFormComponent implements OnInit {
  @Input() empresa: Empresa | null = null;
  @Output() save = new EventEmitter<Partial<EmpresaRequest>>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      codigoBc: [null],
      valorMinimoMensal: [null],
      minimoPorFuncionario: [null],
      valorMes: [null],
      observacao: [null]
    });
  }

  ngOnInit() {
    if (this.empresa) {
      this.form.patchValue(this.empresa);
    }
  }

  onSubmit() {
    if (this.form.valid) {
      this.save.emit(this.form.value);
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  get isEditMode(): boolean {
    return !!this.empresa;
  }

}
