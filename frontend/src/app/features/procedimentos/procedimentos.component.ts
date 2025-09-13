import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProcedimentosService } from './procedimentos.service';
import { Procedimento } from './procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ProcedimentoFormComponent } from './procedimento-form/procedimento-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ProcedimentoDetalhesComponent } from './procedimento-detalhes/procedimento-detalhes.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-procedimentos',
  templateUrl: './procedimentos.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ProcedimentoFormComponent,
    PaginationComponent,
    ProcedimentoDetalhesComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent
  ]
})
export class ProcedimentosComponent extends BaseListComponent<Procedimento> implements OnInit {
  override nomeEntidade = 'Procedimento';

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
        this.itensInternos = response.items;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  override filter(procedimento: Procedimento, searchTerm: string): boolean | undefined {
    return procedimento.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.codigo?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.observacoes?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.especialidade.nome?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovo(procedimento: Partial<Procedimento>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.procedimentosService.atualizar(id, procedimento).subscribe({
        next: () => {
          this.toastr.success(`Registro atualizado`);
          this.carregarProcedimentos();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else {
      this.procedimentosService.criar(procedimento).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado`);
          this.carregarProcedimentos();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  override excluir() {
    super.excluir();
    this.procedimentosService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluído`);
        this.carregarProcedimentos();
      }
    });
  }

  restaurar(event: Event, procedimento: Procedimento) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.procedimentosService.restaurar(procedimento.id).subscribe({
      next: () => {
        procedimento.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado`);
      }
    });
  }

  mostrarEdicao(procedimento: Procedimento) {
    this.itemEdicao = procedimento;
    this.mostrarFormularioNovo = true;
    this.itemSelecionado = null;
  }
}
