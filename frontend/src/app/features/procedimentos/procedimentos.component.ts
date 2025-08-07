import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProcedimentosService } from './procedimentos.service';
import { Procedimento } from './procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ProcedimentoFormComponent } from './procedimento-form/procedimento-form.component';
import { BaseListComponent } from '../shared/base-list.component';

@Component({
  selector: 'app-procedimentos',
  templateUrl: './procedimentos.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ProcedimentoFormComponent
  ]
})
export class ProcedimentosComponent extends BaseListComponent<Procedimento> implements OnInit {
  protected Math = Math;
  procedimentos: Procedimento[] = [];
  nomeEntidade = 'procedimento';

  constructor(private procedimentosService: ProcedimentosService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarProcedimentos();
  }

  carregarProcedimentos(): void {
    this.isLoading = true;
    this.procedimentosService.listar().subscribe({
      next: (response) => {
        this.procedimentos = response.items;
        this.items = [...this.procedimentos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error(`Erro ao carregar a lista de ${this.nomeEntidade}. Por favor, tente novamente.`);
      }
    });
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.procedimentos.filter(procedimento =>
        procedimento.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        procedimento.codigo?.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        procedimento.observacoes?.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        procedimento.especialidade.nome?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.items = [...this.procedimentos];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onSalvarNovo(procedimento: Partial<Procedimento>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.procedimentosService.atualizar(id, procedimento).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} atualizado com sucesso`);
          this.carregarProcedimentos();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, `Erro ao atualizar ${this.nomeEntidade}`);
        }
      });
    } else {
      this.procedimentosService.criar(procedimento).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado com sucesso`);
          this.carregarProcedimentos();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error(`Erro ao cadastrar ${this.nomeEntidade}`);
          console.error(`Erro ao cadastrar ${this.nomeEntidade}:`, error);
        }
      });
    }
  }

  excluir(event: Event, procedimento: Procedimento) {
    event.stopPropagation();
    this.dropdownAberto = null;
    if (confirm(`Deseja realmente excluir o ${this.nomeEntidade} ${procedimento.nome}?`)) {
      this.procedimentosService.excluir(procedimento.id).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} excluído com sucesso`);
          this.carregarProcedimentos();
        },
        error: () => {
          this.toastr.error(`Erro ao excluir ${this.nomeEntidade}`);
        }
      });
    }
  }

  restaurar(event: Event, procedimento: Procedimento) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.procedimentosService.restaurar(procedimento.id).subscribe({
      next: () => {
        procedimento.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado com sucesso!`);
      },
      error: (error) => {
        this.toastr.error(`Erro ao restaurar o ${this.nomeEntidade}`);
        console.error(`Erro ao restaurar ${this.nomeEntidade}:`, error);
      }
    });
  }

}
