import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Atendimento, AtendimentoRequest } from '../atendimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { limitLength } from '../../../core/util-methods';
import { NgxMaskDirective } from 'ngx-mask';
import { ConfirmDialogComponent } from '../../shared/confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-atendimento-form',
  templateUrl: './atendimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective,
    ConfirmDialogComponent
  ]
})
export class AtendimentoFormComponent extends FormComponent<AtendimentoRequest> implements OnInit {
  @Input() atendimento: Atendimento | null = null;
  titulo: string = 'Novo Atendimento';
  exibeConfirmCancelamento: boolean = false;

  constructor(protected override fb: FormBuilder) {
    super(fb);
    this.form = this.fb.group({
      anamnese: [null],
      exameFisico: [null],
      diagnostico: [null],
      evolucaoClinica: [null],
      examesSolicitados: [null],
      prescricoes: [null],
      observacoes: [null]
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
