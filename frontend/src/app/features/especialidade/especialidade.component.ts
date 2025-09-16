import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EspecialidadeService } from './especialidade.service';
import { Especialidade } from './especialidade.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { EspecialidadeFormComponent } from './especialidade-form/especialidade-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';

@Component({
  selector: 'app-especialidades',
  templateUrl: './especialidade.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    EspecialidadeFormComponent,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent,
    LoadingSpinnerComponent
  ]
})
export class EspecialidadeComponent extends BaseListComponent<Especialidade> implements OnInit {
  override nomeEntidade = 'Especialidade';

  constructor(private especialidadesService: EspecialidadeService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarEspecialidades();
  }

  carregarEspecialidades(): void {
    this.isLoading = true;
    this.especialidadesService.listar(true).subscribe({
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

  override filter(especialidade: Especialidade, searchTerm: string): boolean | undefined {
    return especialidade.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      especialidade.descricao?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoEspecialidades(especialidade: Partial<Especialidade>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.especialidadesService.atualizar(id, especialidade).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} atualizada`);
          this.carregarEspecialidades();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else {
      this.especialidadesService.criar(especialidade).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrada`);
          this.carregarEspecialidades();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  override excluir() {
    super.excluir();
    this.especialidadesService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluída`);
        this.carregarEspecialidades();
      }
    });
  }

  restaurarItem(event: Event, especialidade: Especialidade) {
    //event.stopPropagation();

    this.especialidadesService.restaurar(especialidade.id).subscribe({
      next: () => {
        especialidade.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurada com sucesso!`);
      }
    });
  }
}
