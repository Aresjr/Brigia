import { Component, HostListener, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConveniosService } from './convenios.service';
import { Convenio } from './convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ConvenioFormComponent } from './convenio-form/convenio-form.component';

type SortDirection = 'asc' | 'desc' | null;
interface SortState {
  column: keyof Convenio | '';
  direction: SortDirection;
}

@Component({
  selector: 'app-convenios',
  templateUrl: './convenios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ConvenioFormComponent
  ]
})
export class ConveniosComponent implements OnInit {
  protected Math = Math;
  convenios: Convenio[] = [];
  conveniosFiltrados: Convenio[] = [];
  isLoading = true;
  dropdownAberto: number | null = null;
  sortState: SortState = { column: '', direction: null };
  paginaAtual = 1;
  itensPorPagina = 12;
  totalPaginas = 1;
  searchTerm: string = '';
  mostrarFormularioNovo = false;
  convenioEmEdicao: Convenio | null = null;

  constructor(
    private conveniosService: ConveniosService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.carregarConvenios();
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    if (this.isDropdownAberto()) {
      this.dropdownAberto = null;
    }
  }

  carregarConvenios(): void {
    this.isLoading = true;
    this.conveniosService.listarConvenios().subscribe({
      next: (response) => {
        this.convenios = response.items;
        this.conveniosFiltrados = [...this.convenios];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar convênios. Por favor, tente novamente.');
      }
    });
  }

  toggleDropdown(event: Event, convenioId: number): void {
    event.stopPropagation();
    if (this.dropdownAberto === convenioId) {
      this.dropdownAberto = null;
    } else {
      this.dropdownAberto = convenioId;
    }
  }

  ordenar(coluna: keyof Convenio): void {
    let direcao: SortDirection = 'asc';

    if (this.sortState.column === coluna) {
      direcao = this.sortState.direction === 'asc' ? 'desc' : 'asc';
    }

    this.sortState = { column: coluna, direction: direcao };

    this.conveniosFiltrados.sort((a, b) => {
      const valorA = a[coluna];
      const valorB = b[coluna];

      if (valorA === valorB) return 0;
      if (valorA === null) return 1;
      if (valorB === null) return -1;

      const comparacao = valorA < valorB ? -1 : 1;
      return direcao === 'asc' ? comparacao : -comparacao;
    });
  }

  getSortIcon(coluna: keyof Convenio): string {
    if (this.sortState.column !== coluna) {
      return '';
    }
    return this.sortState.direction === 'asc' ? 'arrow-up-icon' : 'arrow-down-icon';
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.conveniosFiltrados = this.convenios.filter(convenio =>
        convenio.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        convenio.descricao?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.conveniosFiltrados = [...this.convenios];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  getConveniosPaginados(): Convenio[] {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.conveniosFiltrados.slice(inicio, fim);
  }

  atualizarPaginacao(): void {
    this.totalPaginas = Math.ceil(this.conveniosFiltrados.length / this.itensPorPagina);
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

  onAddNovoConvenio() {
    this.mostrarFormularioNovo = true;
  }

  onSalvarNovoConvenio(convenio: Partial<Convenio>) {
    if (this.convenioEmEdicao) {
      const id = this.convenioEmEdicao.id;
      this.conveniosService.atualizarConvenio(id, convenio).subscribe({
        next: () => {
          this.toastr.success('Convênio atualizado com sucesso');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
          this.convenioEmEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar convênio');
        }
      });
    } else {
      this.conveniosService.criarConvenio(convenio).subscribe({
        next: () => {
          this.toastr.success('Convênio cadastrado com sucesso');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error('Erro ao cadastrar convênio');
          console.error('Erro ao cadastrar convênio:', error);
        }
      });
    }
  }

  onCancelarNovoConvenio() {
    this.mostrarFormularioNovo = false;
    this.convenioEmEdicao = null;
  }

  editarConvenio(event: Event, convenio: Convenio) {
    event.stopPropagation();
    this.convenioEmEdicao = convenio;
    this.mostrarFormularioNovo = true;
  }

  excluirConvenio(event: Event, convenio: Convenio) {
    event.stopPropagation();
    if (confirm(`Deseja realmente excluir o convênio ${convenio.nome}?`)) {
      this.conveniosService.excluirConvenio(convenio.id).subscribe({
        next: () => {
          this.toastr.success('Convênio excluído com sucesso');
          this.carregarConvenios();
        },
        error: () => {
          this.toastr.error('Erro ao excluir convênio');
        }
      });
    }
  }

  isDropdownAberto(): boolean {
    return this.dropdownAberto !== null;
  }
}
