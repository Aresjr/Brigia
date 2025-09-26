import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { DatePipe, DecimalPipe, NgClass, NgIf } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ContaReceber } from './contas-receber.interface';
import { FORMAS_PAGAMENTO, StatusContaReceber } from '../../core/constans';
import { ContaReceberDonutComponent } from './conta-receber-donut.component';
import { AdicionarValorFaturadoComponent } from './adicionar-valor/adicionar-valor-faturado.component';

@Component({
  selector: 'app-contas-receber-detalhes',
  templateUrl: './contas-receber-detalhes.component.html',
  imports: [
    ReactiveFormsModule, NgClass,
    LucideAngularModule, NgIf, ContaReceberDonutComponent, DatePipe, DecimalPipe, AdicionarValorFaturadoComponent
  ]
})
export class ContasReceberDetalhesComponent {
  @Input() contaReceber!: ContaReceber;
  @Output() fechou = new EventEmitter<void>();
  exibeAdicionarValor: boolean =  false;

  constructor() {}

  fechar(): void {
    this.fechou.emit();
  }

  confirmacaoCobranca() {
    console.log('confirmacaoCobranca');
  }

  valorAdicionado(contaReceber: ContaReceber) {
    this.contaReceber = contaReceber;
    this.exibeAdicionarValor = false;
  }

  protected readonly StatusContaReceber = StatusContaReceber;
  protected readonly FORMAS_PAGAMENTO = FORMAS_PAGAMENTO;
}
