import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { NgClass } from '@angular/common';
import { ContaReceberService } from '../contas-receber.service';
import { ContaReceber } from '../contas-receber.interface';
import { LoadingSpinnerComponent } from '../../shared/loading/loading-spinner.component';

@Component({
  selector: 'app-adicionar-valor-faturado',
  templateUrl: './adicionar-valor-faturado.component.html',
  imports: [
    FormsModule,
    NgxMaskDirective,
    ReactiveFormsModule,
    NgClass,
    LoadingSpinnerComponent
  ],
  standalone: true
})
export class AdicionarValorFaturadoComponent {
  @Input() message = 'Tem certeza que deseja continuar?';
  @Input() contaReceber!: ContaReceber;
  @Output() confirm = new EventEmitter<ContaReceber>();
  @Output() cancel = new EventEmitter<void>();
  valorRecebido = new FormControl<number | null>(null);
  usarValorTotal = false;
  isLoading: boolean = false;

  constructor(private contaReceberService: ContaReceberService) {}

  onConfirm() {
    if (!this.isInvalid(this.valorRecebido) && this.valorRecebido.value != null) {

      this.isLoading = true;
      this.contaReceberService.registrarRecebimento(this.contaReceber.id, this.valorRecebido.value)
        .subscribe({
          next: (response) => {
            this.isLoading = false;
            this.confirm.emit(response);
          },
          error: () => {
            this.isLoading = false;
          }
        });

    } else {
      this.valorRecebido.markAsTouched({ onlySelf: true });
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  preencherValorTotal() {
    if (this.usarValorTotal) {
      const aReceber = this.contaReceber.valorTotal - this.contaReceber.valorRecebido;
      this.valorRecebido.setValue(aReceber);
      this.valorRecebido.disable();
    } else {
      this.valorRecebido.reset();
      this.valorRecebido.enable();
    }
  }

  isInvalid(control: FormControl): boolean {
    return (control && control.invalid && (control.touched || control.dirty));
  }

  protected readonly limitLength = limitLength;
}
