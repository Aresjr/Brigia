import { Component, EventEmitter, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { EntidadeRequest } from './entidade.interface';

@Component({
  template: ''
})
export abstract class FormComponent<Request extends EntidadeRequest> {
  @Output() save = new EventEmitter<Partial<Request>>();
  @Output() cancel = new EventEmitter<void>();

  protected constructor(protected fb: FormBuilder) {
    this.form = this.fb.group({});
  }

  protected form: FormGroup;

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

  styleClassesField(field: string, isReadOnly: boolean = false): string[] {
    const classes = [];
    if (this.isInvalid(field)) {
      classes.push('border', 'border-red-500');
    }
    if (isReadOnly) {
      classes.push('opacity-50', 'cursor-not-allowed');
    }
    console.log('styleClassesField', classes);
    return classes;
  }

  isInvalid(field: string): boolean | undefined {
    const control = this.form.get(field);
    return !!(control && control.invalid && (control.touched || control.dirty));
  }
}
