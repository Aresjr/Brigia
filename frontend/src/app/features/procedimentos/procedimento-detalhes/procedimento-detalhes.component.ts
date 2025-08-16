import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PrecoProcedimentoConvenio, Procedimento, TabelaPrecoResponse } from '../procedimento.interface';
import { ProcedimentosService } from '../procedimentos.service';
import { ToastrService } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-procedimento-detalhes',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule],
  templateUrl: './procedimento-detalhes.component.html',
})
export class ProcedimentoDetalhesComponent implements OnInit {
  @Input() procedimento: Procedimento | null = null;
  @Output() fechou = new EventEmitter<void>();
  tabelaPreco: TabelaPrecoResponse | undefined = undefined;
  mostraTabelaConvenio: boolean = false;
  mostraTabelaEmpresa: boolean = false;

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

  toggleTabelaConvenio() {
    this.mostraTabelaConvenio = !this.mostraTabelaConvenio;
  }

  toggleTabelaEmpresas() {
    this.mostraTabelaEmpresa = !this.mostraTabelaEmpresa;
  }

  atualizarPreco(precoConvenio: PrecoProcedimentoConvenio) {
    this.procedimentosService.atualizarPreco(precoConvenio).subscribe({
      next: (response) => {
        this.toastr.success('Preço atualizado');
      },
      error: (error) => {
        this.toastr.error('Erro ao atualizar preco', error);
      }
    });
  }
}
