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

  styleClassesField(field: string, isReadOnly: boolean = false): string[] {
    const classes = [];
    if (this.isInvalid(field)) {
      classes.push('border', 'border-red-500');
    }
    if (isReadOnly) {
      classes.push('opacity-50', 'cursor-not-allowed');
    }
    return classes;
  }

  isInvalid(field: string): boolean | undefined {
    const control = this.form.get(field);
    return !!(control && control.invalid && (control.touched || control.dirty));
  }
}
