import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { DatePipe, DecimalPipe, NgClass, NgIf } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ContaReceber } from './contas-receber.interface';
import { FORMAS_PAGAMENTO, StatusContaReceber } from '../../core/constans';
import { ContaReceberDonutComponent } from './conta-receber-donut.component';
import { AdicionarValorFaturadoComponent } from './adicionar-valor/adicionar-valor-faturado.component';
import { ToastrService } from 'ngx-toastr';

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
  @Output() fechou = new EventEmitter<boolean>();
  exibeAdicionarValor: boolean =  false;
  alterouInformacoes: boolean = false;

  constructor(private toastr: ToastrService) {}

  fechar(): void {
    this.fechou.emit(this.alterouInformacoes);
  }

  confirmacaoCobranca() {
    console.log('confirmacaoCobranca'); //TODO - implementar
  }

  valorAdicionado(contaReceber: ContaReceber) {
    this.contaReceber = contaReceber;
    this.exibeAdicionarValor = false;
    this.alterouInformacoes = true;
    this.toastr.success('Valor marcado como recebido');
  }

  protected readonly StatusContaReceber = StatusContaReceber;
  protected readonly FORMAS_PAGAMENTO = FORMAS_PAGAMENTO;
}
