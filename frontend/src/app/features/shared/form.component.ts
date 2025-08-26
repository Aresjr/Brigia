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
    return this.isValid(field) ? ['border', 'border-red-500'] : ['border', 'border-gray-300'];
  }

  isValid(field: string): boolean | undefined {
    return this.form?.get(field)?.invalid && this.form.get(field)?.touched;
  }
}
