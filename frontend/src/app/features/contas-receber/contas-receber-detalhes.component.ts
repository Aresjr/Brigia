import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DatePipe, DecimalPipe, NgClass, NgIf } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ContaReceber } from './contas-receber.interface';
import { FORMAS_PAGAMENTO, StatusContaReceber } from '../../core/constans';
import { ContaReceberDonutComponent } from './conta-receber-donut.component';
import { AdicionarValorFaturadoComponent } from './adicionar-valor/adicionar-valor-faturado.component';
import { ToastrService } from 'ngx-toastr';
import { ContaReceberService } from './contas-receber.service';
import { NgxMaskDirective } from 'ngx-mask';

@Component({
  selector: 'app-contas-receber-detalhes',
  templateUrl: './contas-receber-detalhes.component.html',
  imports: [
    ReactiveFormsModule, FormsModule, NgClass,
    LucideAngularModule, NgIf, ContaReceberDonutComponent, DatePipe, DecimalPipe, AdicionarValorFaturadoComponent,
    NgxMaskDirective
  ]
})
export class ContasReceberDetalhesComponent {
  @Input() contaReceber!: ContaReceber;
  @Output() fechou = new EventEmitter<boolean>();
  exibeAdicionarValor: boolean =  false;
  alterouInformacoes: boolean = false;
  descontoEditavel: boolean = false;
  descontoTemp: number = 0;

  constructor(private toastr: ToastrService, private contaReceberService: ContaReceberService) {}

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

  habilitarEdicaoDesconto() {
    this.descontoTemp = this.contaReceber.valorDesconto;
    this.descontoEditavel = true;
  }

  cancelarEdicaoDesconto() {
    this.descontoEditavel = false;
    this.descontoTemp = 0;
  }

  salvarDesconto() {
    if (this.descontoTemp < 0) {
      this.toastr.error('O desconto não pode ser negativo');
      return;
    }

    const valorTotal = this.contaReceber.valorAgendamento + (this.contaReceber.valorProcedimentosLancados || 0);
    if (this.descontoTemp > valorTotal) {
      this.toastr.error('O desconto não pode ser maior que o valor total');
      return;
    }

    this.contaReceberService.atualizarDesconto(this.contaReceber.id, this.descontoTemp).subscribe({
      next: (contaAtualizada) => {
        this.contaReceber = contaAtualizada;
        this.descontoEditavel = false;
        this.alterouInformacoes = true;
        this.toastr.success('Desconto atualizado com sucesso');
      },
      error: () => {
        this.toastr.error('Erro ao atualizar desconto');
      }
    });
  }

  protected readonly StatusContaReceber = StatusContaReceber;
  protected readonly FORMAS_PAGAMENTO = FORMAS_PAGAMENTO;
}
