import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Atendimento, AtendimentoRequest } from '../atendimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { limitLength } from '../../../core/util-methods';
import { NgxMaskDirective } from 'ngx-mask';

@Component({
  selector: 'app-atendimento-form',
  templateUrl: './atendimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective
  ]
})
export class AtendimentoFormComponent extends FormComponent<AtendimentoRequest> implements OnInit {
  @Input() atendimento: Atendimento | null = null;
  titulo: string = 'Atendimento';
  exibeConfirmCancelamento: boolean = false;

  constructor(protected override fb: FormBuilder) {
    super(fb);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      descricao: [null]
    });
  }

  ngOnInit() {
    if (this.atendimento) {
      this.form.patchValue(this.atendimento);
    }
  }

  fechar(confirmou: boolean = false) {
    if (!confirmou && this.form.dirty) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }

  protected readonly limitLength = limitLength;
}
