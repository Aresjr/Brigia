import { Component, Input, Output, EventEmitter } from '@angular/core';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-pagination',
  imports: [
    LucideAngularModule
  ],
  templateUrl: './pagination.component.html'
})
export class PaginationComponent {
  @Input() items: any[] = [];
  @Input() paginaAtual = 1;
  @Input() itensPorPagina = 15;
  @Input() totalPaginas = 1;
  @Output() pageChange = new EventEmitter<number>();
  protected maxPaginasVisiveis = 5;

  mudarPagina(pagina: number): void {
    if (pagina >= 1 && pagina <= this.totalPaginas) {
      this.paginaAtual = pagina;
      this.pageChange.emit(this.paginaAtual);
    }
  }

  getPaginasArray(): number[] {
    const half = Math.floor(this.maxPaginasVisiveis / 2);

    let start = Math.max(1, this.paginaAtual - half);
    let end = Math.min(this.totalPaginas, start + this.maxPaginasVisiveis - 1);

    start = Math.max(1, end - this.maxPaginasVisiveis + 1);

    return Array.from({ length: end - start + 1 }, (_, i) => start + i);
  }

  getRegistroInicial(): number {
    if (this.items.length === 0) return 0;
    return Math.min(((this.paginaAtual - 1) * this.itensPorPagina) + 1, this.items.length);
  }

  getRegistroFinal(): number {
    return Math.min(this.paginaAtual * this.itensPorPagina, this.items.length);
  }
}
