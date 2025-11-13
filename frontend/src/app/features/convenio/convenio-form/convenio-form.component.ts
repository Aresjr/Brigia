import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Convenio, ConvenioRequest } from '../convenio.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { ToastrService } from 'ngx-toastr';

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
export class ConvenioFormComponent extends FormComponent<Convenio, ConvenioRequest> implements OnInit {

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      descricao: [null]
    });
  }
}
