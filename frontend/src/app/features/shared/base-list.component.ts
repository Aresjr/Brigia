import { Component, HostListener } from '@angular/core';
import { Entidade } from './entidade.interface';

type SortDirection = 'asc' | 'desc' | null;

interface SortState<T> {
  column: keyof T | '';
  direction: SortDirection;
}

@Component({
  template: '',
})
export abstract class BaseListComponent<T extends object> {

  itensExibicao: T[] = [];
  itensInternos: T[] = [];
  sortState: SortState<T> = { column: '', direction: null };
  paginaAtual = 1;
  itensPorPagina = 10;
  totalPaginas = 1;
  dropdownAberto: number | null = null;
  itemSelecionado: T | null = null;
  itemEdicao: T | null = null;
  mostrarFormularioNovo = false;
  isLoading = true;
  nomeEntidade = '';
  exibeConfirmExclusao = false;
  idExclusao: number = 0;
  fabOpen: boolean = false;

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    if (this.isDropdownAberto()) {
      this.dropdownAberto = null;
    }
  }

  getItensPaginados(): T[] {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.itensExibicao.slice(inicio, fim);
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

    this.itensExibicao.sort((a, b) => {
      const valorA: NonNullable<T[keyof T]> | '' = a[coluna] || '';
      const valorB: NonNullable<T[keyof T]> | '' = b[coluna] || '';

      if (valorA === valorB) {
        return 0;
      }

      const comparacao = this.toComparableString(valorA) < this.toComparableString(valorB) ? -1 : 1;
      return direcao === 'asc' ? comparacao : -comparacao;
    });
  }

  atualizarPaginacao(): void {
    this.totalPaginas = Math.ceil(this.itensExibicao.length / this.itensPorPagina);
    if (this.paginaAtual > this.totalPaginas) {
      this.paginaAtual = this.totalPaginas || 1;
    }
  }

  mudarPagina(pagina: number): void {
    if (pagina >= 1 && pagina <= this.totalPaginas) {
      this.paginaAtual = pagina;
    }
  }

  pageChange(page: number) {
    this.mudarPagina(page);
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

  fecharConfirmExclusao(): void {
    this.exibeConfirmExclusao = false;
  }

  onAddNovo() {
    this.mostrarFormularioNovo = true;
    this.itemSelecionado = null;
  }

  cancelarNovo() {
    this.mostrarFormularioNovo = false;
    this.itemEdicao = null;
  }

  editar(event: Event, item: T) {
    event.stopPropagation();
    this.dropdownAberto = null;
    this.itemEdicao = item;
    this.mostrarFormularioNovo = true;
  }

  perguntaExcluir(event: Event, entidade: Entidade) {
    event.stopPropagation();
    this.dropdownAberto = null;
    this.idExclusao = entidade.id;
    this.exibeConfirmExclusao = true;
  }

  onSearch($event: any): void {
    const searchTerm = $event.toLowerCase();
    if (searchTerm) {
      this.itensExibicao = this.itensInternos.filter(item => this.filter(item, searchTerm));
    } else {
      this.itensExibicao = [...this.itensInternos];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  filter(entidade: T, searchTerm: string): boolean | undefined {
    return false;
  }

  excluir() {
    this.exibeConfirmExclusao = false;
  }

  private toComparableString(valor: NonNullable<T[keyof T]> | '' | number): string | number {
    if (typeof valor == 'string' || typeof valor == 'number') {
      return valor;
    }
    return (valor.valueOf() as Entidade).nome;
  }
}
