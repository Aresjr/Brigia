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
    TopBarComponent
  ],
  templateUrl: './profissionais.component.html',
  standalone: true
})
export class ProfissionaisComponent extends BaseListComponent<Profissional> implements OnInit {

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
        this.toastr.error('Erro ao carregar profissionais. Por favor, tente novamente.');
      }
    });
  }

  handleAction(event: Event, action: string, profissional: Profissional) {
    event.stopPropagation();
    this.dropdownAberto = null;

    switch (action) {
      case 'agendar':
        //TODO: Implementar agendamento de profissional
        this.toastr.warning('Agenda de Profissional será implementada em breve.');
        break;
      case 'historico':
        //TODO: Implementar histórico de profissional
        this.toastr.warning('Histórico de Profissional será implementado em breve.');
        break;
      case 'excluir':
        //TODO: Implementar exclusão de profissional
        this.toastr.warning('Exclusão de Profissional será implementada em breve.');
        break;
    }
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
          this.toastr.success('Registro atualizado com sucesso');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar profissional');
          console.error('Erro ao atualizar profissional:', e.error);
        }
      });
    } else {
      this.profissionaisService.criar(profissional).subscribe({
        next: () => {
          this.toastr.success('Profissional cadastrado com sucesso');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
        },
        error: (e) => {
          const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
          this.toastr.error(errorMessage, 'Erro ao cadastrar profissional');
          console.error('Erro ao cadastrar profissional:', e);
        }
      });
    }
  }
}
