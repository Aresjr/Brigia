import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
import { PacienteDetalhesComponent } from './paciente-detalhes/paciente-detalhes.component';
import {LucideAngularModule} from 'lucide-angular';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';

type SortDirection = 'asc' | 'desc' | null;
interface SortState {
  column: keyof Paciente | '';
  direction: SortDirection;
}

@Component({
  selector: 'app-pacientes',
  imports: [CommonModule, PacienteDetalhesComponent, LucideAngularModule, TopBarComponent],
  templateUrl: './pacientes.component.html',
  standalone: true
})
export class PacientesComponent implements OnInit {
  pacientes: Paciente[] = [];
  isLoading = true;
  pacienteSelecionado: Paciente | null = null;
  dropdownAbertoPara: number | null = null;
  sortState: SortState = { column: '', direction: null };

  constructor(private pacientesService: PacientesService) {}

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.isLoading = true;
    this.pacientesService.listarPacientes().subscribe({
      next: (response) => {
        this.pacientes = response.items;
        this.isLoading = false;
      },
      error: (error) => {
        console.error('Erro ao carregar pacientes:', error);
        this.isLoading = false;
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

  handleAction(event: Event, action: string, paciente: Paciente): void {
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
      case 'editar':
        // TODO: Implementar edição
        console.log('Editar', paciente);
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

    this.pacientes.sort((a, b) => {
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

  novoPaciente() {
    console.log('Novo Paciente');
  }
}
