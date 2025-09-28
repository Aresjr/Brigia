import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Entidade, EntidadeRequest } from './entidade.interface';
import { ToastrService } from 'ngx-toastr';

@Component({
  template: ''
})
export abstract class FormComponent<E extends Entidade, Request extends EntidadeRequest> implements OnInit {
  @Input() registro: E | null = null;
  @Output() save = new EventEmitter<Partial<Request>>();
  @Output() cancel = new EventEmitter<void>();

  protected constructor(protected fb: FormBuilder,
                        protected toastr: ToastrService) {
    this.form = this.fb.group({});
  }

  protected form: FormGroup;

  ngOnInit() {
    if (this.registro) {
      this.form.patchValue(this.registro);
    }
  }

  onSubmit() {
    if (this.form.valid) {
      this.save.emit(this.form.value);
    } else {
      this.toastr.warning('Verifique os campos preenchidos');
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
    return !!this.registro;
  }

  classesCampo(field: string, isReadOnly: boolean = false): string[] {
    const classes = [];
    if (this.isInvalid(field)) {
      classes.push('border', 'border-error');
    }
    if (isReadOnly) {
      classes.push('opacity-50', 'cursor-not-allowed', 'input-view-only');
    }
    return classes;
  }

  isInvalid(field: string): boolean | undefined {
    const control = this.form.get(field);
    return !!(control && control.invalid && (control.touched || control.dirty));
  }
}
