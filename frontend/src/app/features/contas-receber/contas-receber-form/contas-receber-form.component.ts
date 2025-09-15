import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { ContaReceber, ContaReceberRequest } from '../contas-receber.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';

@Component({
  selector: 'app-contas-receber-form',
  templateUrl: './contas-receber-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective
  ]
})
export class ContaReceberFormComponent implements OnInit {
  @Input() contaReceber: ContaReceber | null = null;
  @Output() save = new EventEmitter<Partial<ContaReceberRequest>>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      descricao: [null]
    });
  }

  ngOnInit() {
    if (this.contaReceber) {
      this.form.patchValue(this.contaReceber);
    }
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

  get isEditMode(): boolean {
    return !!this.contaReceber;
  }

}
