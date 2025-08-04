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

@Component({
  selector: 'app-profissionais',
  imports: [
    CommonModule,
    ProfissionalDetalhesComponent,
    ProfissionalFormComponent,
    LucideAngularModule,
    FormsModule,
    CelularPipe
  ],
  templateUrl: './profissionais.component.html',
  standalone: true
})
export class ProfissionaisComponent extends BaseListComponent<Profissional> implements OnInit {
  protected Math = Math;
  profissionais: Profissional[] = [];
  isLoading = true;
  profissionalSelecionado: Profissional | null = null;
  mostrarFormularioNovo = false;
  profissionalEmEdicao: Profissional | null = null;

  constructor(private profissionaisService: ProfissionaisService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarProfissionais();
  }

  carregarProfissionais(): void {
    this.isLoading = true;
    this.profissionaisService.listarProfissionais().subscribe({
      next: (response) => {
        this.profissionais = response.items;
        this.items = [...this.profissionais];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: (error) => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar profissionais. Por favor, tente novamente.');
      }
    });
  }

  selecionarProfissional(profissional: Profissional): void {
    this.profissionalSelecionado = profissional;
  }

  fecharDetalhes(): void {
    this.profissionalSelecionado = null;
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

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.profissionais.filter(profissional =>
        profissional.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        profissional.celular?.includes(this.searchTerm) ||
        profissional.crm?.includes(this.searchTerm) ||
        profissional.email?.includes(this.searchTerm)
      );
    } else {
      this.items = [...this.profissionais];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onAddNovoProfissional() {
    this.mostrarFormularioNovo = true;
    this.profissionalSelecionado = null;
  }

  onSalvarNovoProfissional(profissional: Partial<Profissional>) {
    if (this.profissionalEmEdicao) {
      const id = this.profissionalEmEdicao.id;
      this.profissionaisService.atualizarProfissional(id, profissional).subscribe({
        next: () => {
          this.toastr.success('Profissional atualizado com sucesso');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
          this.profissionalEmEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar profissional');
          console.error('Erro ao atualizar profissional:', e.error);
        }
      });
    } else {
      this.profissionaisService.criarProfissional(profissional).subscribe({
        next: () => {
          this.toastr.success('Profissional cadastrado com sucesso');
          this.carregarProfissionais();
          this.mostrarFormularioNovo = false;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao cadastrar profissional');
          console.error('Erro ao cadastrar profissional:', e);
        }
      });
    }
  }

  onCancelarNovoProfissional() {
    this.mostrarFormularioNovo = false;
    this.profissionalEmEdicao = null;
  }

  editarProfissional(event: Event, profissional: Profissional) {
    event.stopPropagation();
    this.profissionalEmEdicao = profissional;
    this.mostrarFormularioNovo = true;
  }
}
