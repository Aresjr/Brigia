import { Component, HostListener, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProfissionaisService } from './profissionais.service';
import { Profissional } from './profissional.interface';
import { ProfissionalDetalhesComponent } from './profissional-detalhes/profissional-detalhes.component';
import { ProfissionalFormComponent } from './profissional-form/profissional-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CelularPipe } from '../../core/pipes/celular.pipe';

type SortDirection = 'asc' | 'desc' | null;
interface SortState {
  column: keyof Profissional | '';
  direction: SortDirection;
}

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
export class ProfissionaisComponent implements OnInit {
  protected Math = Math;
  profissionais: Profissional[] = [];
  profissionaisFiltrados: Profissional[] = [];
  isLoading = true;
  profissionalSelecionado: Profissional | null = null;
  dropdownAberto: number | null = null;
  sortState: SortState = { column: '', direction: null };
  paginaAtual = 1;
  itensPorPagina = 12;
  totalPaginas = 1;
  searchTerm: string = '';
  mostrarFormularioNovo = false;
  profissionalEmEdicao: Profissional | null = null;

  constructor(private profissionaisService: ProfissionaisService, private toastr: ToastrService) {}

  ngOnInit(): void {
    this.carregarProfissionais();
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    if (this.isDropdownAberto()) {
      this.dropdownAberto = null;
    }
  }

  carregarProfissionais(): void {
    this.isLoading = true;
    this.profissionaisService.listarProfissionais().subscribe({
      next: (response) => {
        this.profissionais = response.items;
        this.profissionaisFiltrados = [...this.profissionais];
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

  toggleDropdown(event: Event, profissionalId: number): void {
    event.stopPropagation();
    if (this.dropdownAberto === profissionalId) {
      this.dropdownAberto = null;
    } else {
      this.dropdownAberto = profissionalId;
    }
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

  ordenar(coluna: keyof Profissional): void {
    let direcao: SortDirection = 'asc';

    if (this.sortState.column === coluna) {
      direcao = this.sortState.direction === 'asc' ? 'desc' : 'asc';
    }

    this.sortState = { column: coluna, direction: direcao };

    this.profissionaisFiltrados.sort((a, b) => {
      const valorA = a[coluna] || '';
      const valorB = b[coluna] || '';

      if (valorA === valorB) return 0;

      const comparacao = valorA < valorB ? -1 : 1;
      return direcao === 'asc' ? comparacao : -comparacao;
    });
  }

  getSortIcon(coluna: keyof Profissional): string {
    if (this.sortState.column !== coluna) {
      return '';
    }
    return this.sortState.direction === 'asc' ? 'arrow-up-icon' : 'arrow-down-icon';
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.profissionaisFiltrados = this.profissionais.filter(profissional =>
        profissional.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        profissional.cpf?.includes(this.searchTerm) ||
        profissional.dataNascimento.includes(this.searchTerm) ||
        profissional.celular?.includes(this.searchTerm)
      );
    } else {
      this.profissionaisFiltrados = [...this.profissionais];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  getProfissionaisPaginados(): Profissional[] {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.profissionaisFiltrados.slice(inicio, fim);
  }

  atualizarPaginacao(): void {
    this.totalPaginas = Math.ceil(this.profissionaisFiltrados.length / this.itensPorPagina);
    if (this.paginaAtual > this.totalPaginas) {
      this.paginaAtual = this.totalPaginas || 1;
    }
  }

  mudarPagina(pagina: number): void {
    if (pagina >= 1 && pagina <= this.totalPaginas) {
      this.paginaAtual = pagina;
    }
  }

  getPaginasArray(): number[] {
    return Array.from({ length: this.totalPaginas }, (_, i) => i + 1);
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

  isDropdownAberto(): boolean {
    return this.dropdownAberto !== null;
  }
}
