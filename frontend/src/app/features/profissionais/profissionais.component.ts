import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProfissionaisService } from './profissionais.service';
import { Profissional } from './profissional.interface';
import { ProfissionalDetalhesComponent } from './profissional-detalhes/profissional-detalhes.component';
import { ProfissionalFormComponent } from './profissional-form/profissional-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CelularPipe } from '../../core/pipes/celular.pipe';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-profissionais',
  imports: [
    CommonModule,
    ProfissionalDetalhesComponent,
    ProfissionalFormComponent,
    LucideAngularModule,
    FormsModule,
    CelularPipe,
    PaginationComponent,
    TopBarComponent,
    FabComponent
  ],
  templateUrl: './profissionais.component.html',
  standalone: true
})
export class ProfissionaisComponent extends BaseListComponent<Profissional> implements OnInit {
  override nomeEntidade = 'Profissional';

  constructor(private profissionaisService: ProfissionaisService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarProfissionais();
  }

  carregarProfissionais(): void {
    this.isLoading = true;
    this.profissionaisService.listar().subscribe({
      next: (response) => {
        this.itensInternos = response.items;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: (error) => {
        this.isLoading = false;
      }
    });
  }

  override filter(profissional: Profissional, searchTerm: string): boolean | undefined {
    return profissional.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      profissional.celular?.includes(searchTerm) ||
      profissional.crm?.includes(searchTerm) ||
      profissional.email?.includes(searchTerm);
  }

  onSalvarNovoProfissional(profissional: Partial<Profissional>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.profissionaisService.atualizar(id, profissional).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else {
      this.profissionaisService.criar(profissional).subscribe({
        next: () => {
          this.toastr.success('Profissional cadastrado');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  restaurarItem($event: MouseEvent, profissional: Profissional) {
    this.profissionaisService.restaurar(profissional.id).subscribe({
      next: () => {
        profissional.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado com sucesso!`);
      }
    });
  }
}
