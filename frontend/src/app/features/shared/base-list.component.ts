
type SortDirection = 'asc' | 'desc' | null;

interface SortState<T> {
  column: keyof T | '';
  direction: SortDirection;
}

export abstract class BaseListComponent<T extends object> {

  items: T[] = [];
  sortState: SortState<T> = { column: '', direction: null };

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

}
