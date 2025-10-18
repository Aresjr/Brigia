import { Component, EventEmitter, Output } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NgIf } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-admin-credentials-dialog',
  standalone: true,
  imports: [ReactiveFormsModule, NgIf, LucideAngularModule],
  templateUrl: './admin-credentials-dialog.component.html',
  styleUrls: ['./admin-credentials-dialog.component.css']
})
export class AdminCredentialsDialogComponent {
  @Output() confirm = new EventEmitter<{ login: string, senha: string }>();
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      login: ['', Validators.required],
      senha: ['', Validators.required]
    });
  }

  onConfirm() {
    if (this.form.valid) {
      this.confirm.emit(this.form.value);
    }
  }

  onCancel() {
    this.cancel.emit();
  }
}
