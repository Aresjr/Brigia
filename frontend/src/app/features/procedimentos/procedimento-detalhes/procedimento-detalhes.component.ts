import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Procedimento, TabelaPrecoResponse } from '../procedimento.interface';
import { ProcedimentosService } from '../procedimentos.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-procedimento-detalhes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './procedimento-detalhes.component.html',
})
export class ProcedimentoDetalhesComponent implements OnInit {
  @Input() procedimento: Procedimento | null = null;
  @Output() fechou = new EventEmitter<void>();
  tabelaPreco: TabelaPrecoResponse | undefined = undefined;

  constructor(private procedimentosService: ProcedimentosService,
              private toastr: ToastrService) {}

  ngOnInit(): void {
    if (this.procedimento) {
      this.procedimentosService.listarTabelaPreco(this.procedimento.id).subscribe({
        next: (response) => {
          this.tabelaPreco = response;
        },
        error: (error) => {
          this.toastr.error('Erro ao carregar a tabela de preço do procedimento.');
        }
      });
    }
  }

  fechar(): void {
    this.fechou.emit();
  }
}
