import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EspecialidadeService } from './especialidade.service';
import { Especialidade } from './especialidade.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { EspecialidadeFormComponent } from './especialidade-form/especialidade-form.component';
import { BaseListComponent } from '../shared/base-list.component';

@Component({
  selector: 'app-especialidades',
  templateUrl: './especialidade.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    EspecialidadeFormComponent
  ]
})
export class EspecialidadeComponent extends BaseListComponent<Especialidade> implements OnInit {
  protected Math = Math;
  especialidades: Especialidade[] = [];

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
        this.especialidades = response.items;
        this.items = [...this.especialidades];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar especialidades. Por favor, tente novamente.');
      }
    });
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.especialidades.filter(especialidade =>
        especialidade.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        especialidade.descricao?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.items = [...this.especialidades];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onSalvarNovoEspecialidades(especialidade: Partial<Especialidade>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.especialidadesService.atualizar(id, especialidade).subscribe({
        next: () => {
          this.toastr.success('Especialidade atualizada com sucesso');
          this.carregarEspecialidades();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar especialidade');
        }
      });
    } else {
      this.especialidadesService.criar(especialidade).subscribe({
        next: () => {
          this.toastr.success('Especialidade cadastrada com sucesso');
          this.carregarEspecialidades();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error('Erro ao cadastrar especialidade');
          console.error('Erro ao cadastrar especialidade:', error);
        }
      });
    }
  }

  excluir(event: Event, especialidade: Especialidade) {
    event.stopPropagation();
    this.dropdownAberto = null;
    if (confirm(`Deseja realmente excluir a especialidade ${especialidade.nome}?`)) { //TODO - alterar para uma biblioteca de confirmação
      this.especialidadesService.excluir(especialidade.id).subscribe({
        next: () => {
          this.toastr.success('Especialidade excluída com sucesso');
          this.carregarEspecialidades();
        },
        error: () => {
          this.toastr.error('Erro ao excluir especialidade');
        }
      });
    }
  }

  restaurarItem(event: Event, especialidade: Especialidade) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.especialidadesService.restaurar(especialidade.id).subscribe({
      next: () => {
        especialidade.excluido = false;
        this.toastr.success('Especialidade restaurada com sucesso!');
      },
      error: (error) => {
        this.toastr.error('Erro ao restaurar a especialidade');
        console.error('Erro ao restaurar especialidade:', error);
      }
    });
  }

}
