import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Convenio } from '../convenio.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';

@Component({
  selector: 'app-convenio-form',
  templateUrl: './convenio-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective
  ]
})
export class ConvenioFormComponent implements OnInit {
  @Input() convenio: Convenio | null = null;
  @Output() save = new EventEmitter<Partial<Convenio>>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      descricao: [null]
    });
  }

  ngOnInit() {
    if (this.convenio) {
      this.form.patchValue(this.convenio);
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
    return !!this.convenio;
  }

}
