import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
import { PacienteDetalhesComponent } from './paciente-detalhes/paciente-detalhes.component';
import { PacienteFormComponent } from './paciente-form/paciente-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

type SortDirection = 'asc' | 'desc' | null;
interface SortState {
  column: keyof Paciente | '';
  direction: SortDirection;
}

@Component({
  selector: 'app-pacientes',
  imports: [
    CommonModule,
    PacienteDetalhesComponent,
    PacienteFormComponent,
    LucideAngularModule,
    FormsModule
  ],
  templateUrl: './pacientes.component.html',
  standalone: true
})
export class PacientesComponent implements OnInit {
  protected Math = Math;
  pacientes: Paciente[] = [];
  pacientesFiltrados: Paciente[] = [];
  isLoading = true;
  pacienteSelecionado: Paciente | null = null;
  dropdownAbertoPara: number | null = null;
  sortState: SortState = { column: '', direction: null };
  paginaAtual = 1;
  itensPorPagina = 12;
  totalPaginas = 1;
  searchTerm: string = '';
  mostrarFormularioNovo = false;
  pacienteEmEdicao: Paciente | null = null;

  constructor(private pacientesService: PacientesService, private toastr: ToastrService) {}

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.isLoading = true;
    this.pacientesService.listarPacientes().subscribe({
      next: (response) => {
        this.pacientes = response.items;
        this.pacientesFiltrados = [...this.pacientes];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: (error) => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar pacientes. Por favor, tente novamente.');
      }
    });
  }

  selecionarPaciente(paciente: Paciente): void {
    this.pacienteSelecionado = paciente;
  }

  fecharDetalhes(): void {
    this.pacienteSelecionado = null;
  }

  toggleDropdown(event: Event, pacienteId: number): void {
    event.stopPropagation();
    if (this.dropdownAbertoPara === pacienteId) {
      this.dropdownAbertoPara = null;
    } else {
      this.dropdownAbertoPara = pacienteId;
    }
  }

  handleAction(event: Event, action: string, paciente: Paciente) {
    event.stopPropagation();
    this.dropdownAbertoPara = null;

    switch (action) {
      case 'agendar':
        // TODO: Implementar agendamento
        console.log('Agendar consulta para', paciente);
        break;
      case 'historico':
        // TODO: Implementar visualização de histórico
        console.log('Ver histórico de', paciente);
        break;
      case 'excluir':
        // TODO: Implementar exclusão
        console.log('Excluir', paciente);
        break;
    }
  }

  ordenar(coluna: keyof Paciente): void {
    let direcao: SortDirection = 'asc';

    if (this.sortState.column === coluna) {
      direcao = this.sortState.direction === 'asc' ? 'desc' : 'asc';
    }

    this.sortState = { column: coluna, direction: direcao };

    this.pacientesFiltrados.sort((a, b) => {
      const valorA = a[coluna];
      const valorB = b[coluna];

      if (valorA === valorB) return 0;
      if (valorA === null) return 1;
      if (valorB === null) return -1;

      const comparacao = valorA < valorB ? -1 : 1;
      return direcao === 'asc' ? comparacao : -comparacao;
    });
  }

  getSortIcon(coluna: keyof Paciente): string {
    if (this.sortState.column !== coluna) {
      return '';
    }
    return this.sortState.direction === 'asc' ? 'arrow-up-icon' : 'arrow-down-icon';
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.pacientesFiltrados = this.pacientes.filter(paciente =>
        paciente.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        paciente.cpf.includes(this.searchTerm) ||
        paciente.dataNascimento.includes(this.searchTerm) ||
        paciente.celular.includes(this.searchTerm)
      );
    } else {
      this.pacientesFiltrados = [...this.pacientes];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  getPacientesPaginados(): Paciente[] {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.pacientesFiltrados.slice(inicio, fim);
  }

  atualizarPaginacao(): void {
    this.totalPaginas = Math.ceil(this.pacientesFiltrados.length / this.itensPorPagina);
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

  onAddNovoPaciente() {
    this.mostrarFormularioNovo = true;
    this.pacienteSelecionado = null;
  }

  onSalvarNovoPaciente(paciente: Partial<Paciente>) {
    if (this.pacienteEmEdicao) {
      const id = this.pacienteEmEdicao.id;
      this.pacientesService.atualizarPaciente(id, paciente).subscribe({
        next: () => {
          this.toastr.success('Paciente atualizado com sucesso');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
          this.pacienteEmEdicao = null;
        },
        error: (error) => {
          this.toastr.error('Erro ao atualizar paciente');
          console.error('Erro ao atualizar paciente:', error);
        }
      });
    } else {
      this.pacientesService.criarPaciente(paciente).subscribe({
        next: () => {
          this.toastr.success('Paciente cadastrado com sucesso');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error('Erro ao cadastrar paciente');
          console.error('Erro ao cadastrar paciente:', error);
        }
      });
    }
  }

  onCancelarNovoPaciente() {
    this.mostrarFormularioNovo = false;
    this.pacienteEmEdicao = null;
  }

  editarPaciente(paciente: Paciente) {
    console.log(paciente);
    this.pacienteEmEdicao = paciente;
    this.mostrarFormularioNovo = true;
  }
}
