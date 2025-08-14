import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConveniosService } from './convenios.service';
import { Convenio } from './convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ConvenioFormComponent } from './convenio-form/convenio-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-convenios',
  templateUrl: './convenios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ConvenioFormComponent,
    PaginationComponent,
    ConfirmDialogComponent
  ]
})
export class ConveniosComponent extends BaseListComponent<Convenio> implements OnInit {
  protected Math = Math;
  convenios: Convenio[] = [];
  override nomeEntidade = 'Convênio';

  constructor(private conveniosService: ConveniosService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarConvenios();
  }

  carregarConvenios(): void {
    this.isLoading = true;
    this.conveniosService.listar(true).subscribe({
      next: (response) => {
        this.convenios = response.items;
        this.items = [...this.convenios];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar convênios. Por favor, tente novamente.');
      }
    });
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.convenios.filter(convenio =>
        convenio.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        convenio.descricao?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.items = [...this.convenios];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onSalvarNovoConvenio(convenio: Partial<Convenio>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.conveniosService.atualizar(id, convenio).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado com sucesso');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
          this.toastr.error(errorMessage, `Erro ao atualizar ${this.nomeEntidade}`);
        }
      });
    } else {
      this.conveniosService.criar(convenio).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado com sucesso`);
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error(`Erro ao cadastrar ${this.nomeEntidade}`);
          console.error(`Erro ao cadastrar ${this.nomeEntidade}:`, error);
        }
      });
    }
  }

  excluir() {
    this.conveniosService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluído com sucesso`);
        this.carregarConvenios();
      },
      error: () => {
        this.toastr.error(`Erro ao excluir ${this.nomeEntidade}`);
      }
    });
  }

  restaurarItem(event: Event, convenio: Convenio) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.conveniosService.restaurar(convenio.id).subscribe({
      next: () => {
        convenio.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado com sucesso!`);
      },
      error: (error) => {
        this.toastr.error(`Erro ao restaurar o ${this.nomeEntidade}`);
        console.error(`Erro ao restaurar ${this.nomeEntidade}:`, error);
      }
    });
  }

}
