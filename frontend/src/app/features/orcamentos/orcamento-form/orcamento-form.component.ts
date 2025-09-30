import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Orcamento, OrcamentoRequest } from '../orcamento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { ToastrService } from 'ngx-toastr';
import { RequiredMarkerDirective } from '../../../core/directives/required-marker-directive';

@Component({
  selector: 'app-orcamento-form',
  templateUrl: './orcamento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    RequiredMarkerDirective
  ]
})
export class OrcamentoFormComponent extends FormComponent<Orcamento, OrcamentoRequest> {
  statusOptions = [
    'Pendente',
    'Aprovado',
    'Rejeitado'
  ];

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      clienteNome: [null, [Validators.required]],
      valor: [null, [Validators.required, Validators.min(0)]],
      status: ['Pendente', [Validators.required]],
      descricao: [null]
    });
  }

  override onSubmit(): void {
    if (this.form.valid) {
      const orcamento: OrcamentoRequest = {
        ...this.form.value,
        valor: Number(this.form.value.valor)
      };
      this.save.emit(orcamento);
    } else {
      this.toastr.error('Por favor, preencha todos os campos obrigatórios.');
    }
  }
}
