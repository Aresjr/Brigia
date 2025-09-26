import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { NgClass } from '@angular/common';

@Component({
  selector: 'app-adicionar-valor-faturado',
  templateUrl: './adicionar-valor-faturado.component.html',
  imports: [
    FormsModule,
    NgxMaskDirective,
    ReactiveFormsModule,
    NgClass
  ],
  standalone: true
})
export class AdicionarValorFaturadoComponent {
  @Input() message = 'Tem certeza que deseja continuar?';
  @Input() valorTotal: number = 0;
  @Output() confirm = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();
  valorRecebido = new FormControl<number | null>(null);
  usarValorTotal = false;

  onConfirm() {
    this.confirm.emit();
  }

  onCancel() {
    this.cancel.emit();
  }

  preencherValorTotal() {
    if (this.usarValorTotal) {
      this.valorRecebido.setValue(this.valorTotal);
      this.valorRecebido.disable();
    } else {
      this.valorRecebido.reset();
      this.valorRecebido.enable();
    }
  }

  protected readonly limitLength = limitLength;
}
