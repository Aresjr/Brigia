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
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';

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
    ConfirmDialogComponent,
    TopBarComponent
  ]
})
export class ConveniosComponent extends BaseListComponent<Convenio> implements OnInit {
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

  override filter(convenio: Convenio, searchTerm: string): boolean | undefined {
    return convenio.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      convenio.descricao?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoConvenio(convenio: Partial<Convenio>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.conveniosService.atualizar(id, convenio).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else {
      this.conveniosService.criar(convenio).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado`);
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  override excluir() {
    super.excluir();
    this.conveniosService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluído`);
        this.carregarConvenios();
      }
    });
  }

  restaurarItem(event: Event, convenio: Convenio) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.conveniosService.restaurar(convenio.id).subscribe({
      next: () => {
        convenio.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado`);
      }
    });
  }
}
