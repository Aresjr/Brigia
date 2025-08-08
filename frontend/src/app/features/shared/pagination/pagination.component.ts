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
  @Input() itensPorPagina = 14;
  @Input() totalPaginas = 1;
  @Output() pageChange = new EventEmitter<number>();
  protected readonly Math = Math;

  mudarPagina(pagina: number): void {
    if (pagina >= 1 && pagina <= this.totalPaginas) {
      this.paginaAtual = pagina;
      this.pageChange.emit(this.paginaAtual);
    }
  }

  getPaginasArray(): number[] {
    return Array.from({ length: this.totalPaginas }, (_, i) => i + 1);
  }

  getRegistroInicial(): number {
    return ((this.paginaAtual - 1) * this.itensPorPagina) + 1;
  }

  getRegistroFinal(): number {
    return Math.min(this.paginaAtual * this.itensPorPagina, this.items.length);
  }
}
