import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  template: ''
})
export abstract class FormComponent {

  protected constructor(protected fb: FormBuilder) {
    this.form = this.fb.group({});
  }

  protected form: FormGroup;

  validationClasses(field: string): string[] {
    return this.isInvalid(field) ? ['border', 'border-red-500'] : [];
  }

  isInvalid(field: string): boolean | undefined {
    const control = this.form.get(field);
    return !!(control && control.invalid && (control.touched || control.dirty));
  }
}
