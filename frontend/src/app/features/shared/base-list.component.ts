import { Component, HostListener } from '@angular/core';

type SortDirection = 'asc' | 'desc' | null;

interface SortState<T> {
  column: keyof T | '';
  direction: SortDirection;
}

@Component({
  template: '',
})
export abstract class BaseListComponent<T extends object> {

  items: T[] = [];
  sortState: SortState<T> = { column: '', direction: null };
  paginaAtual = 1;
  itensPorPagina = 14;
  totalPaginas = 1;
  searchTerm: string = '';
  dropdownAberto: number | null = null;
  itemSelecionado: T | null = null;
  itemEdicao: T | null = null;
  mostrarFormularioNovo = false;
  isLoading = true;

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    if (this.isDropdownAberto()) {
      this.dropdownAberto = null;
    }
  }

  getItensPaginados(): T[] {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.items.slice(inicio, fim);
  }

  getSortIcon(coluna: string): string {
    if (this.sortState.column !== coluna) {
      return '';
    }
    return this.sortState.direction === 'asc' ? 'arrow-up-icon' : 'arrow-down-icon';
  }

  ordenar(coluna: keyof T): void {
    let direcao: SortDirection = 'asc';

    if (this.sortState.column === coluna) {
      direcao = this.sortState.direction === 'asc' ? 'desc' : 'asc';
    }

    this.sortState = { column: coluna, direction: direcao };

    this.items.sort((a, b) => {
      const valorA = a[coluna] || '';
      const valorB = b[coluna] || '';

      if (valorA === valorB) return 0;

      const comparacao = valorA < valorB ? -1 : 1;
      return direcao === 'asc' ? comparacao : -comparacao;
    });
  }

  atualizarPaginacao(): void {
    this.totalPaginas = Math.ceil(this.items.length / this.itensPorPagina);
    if (this.paginaAtual > this.totalPaginas) {
      this.paginaAtual = this.totalPaginas || 1;
    }
  }

  mudarPagina(pagina: number): void {
    if (pagina >= 1 && pagina <= this.totalPaginas) {
      this.paginaAtual = pagina;
    }
  }

  isDropdownAberto(): boolean {
    return this.dropdownAberto !== null;
  }

  toggleDropdown(event: Event, id: number): void {
    event.stopPropagation();
    if (this.dropdownAberto === id) {
      this.dropdownAberto = null;
    } else {
      this.dropdownAberto = id;
    }
  }

  selecionar(item: T): void {
    this.itemSelecionado = item;
  }

  fecharDetalhes(): void {
    this.itemSelecionado = null;
  }

  onAddNovo() {
    this.mostrarFormularioNovo = true;
    this.itemSelecionado = null;
  }

  onCancelarNovo() {
    this.mostrarFormularioNovo = false;
    this.itemEdicao = null;
  }

  editar(event: Event, item: T) {
    event.stopPropagation();
    this.dropdownAberto = null;
    this.itemEdicao = item;
    this.mostrarFormularioNovo = true;
  }
}
