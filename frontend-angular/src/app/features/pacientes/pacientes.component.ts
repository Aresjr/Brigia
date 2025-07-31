import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
import { ToastrService } from 'ngx-toastr';
import { PacienteDetalhesComponent } from './paciente-detalhes/paciente-detalhes.component';

@Component({
  selector: 'app-pacientes',
  imports: [CommonModule, PacienteDetalhesComponent],
  templateUrl: './pacientes.component.html',
  standalone: true
})
export class PacientesComponent implements OnInit {
  pacientes: Paciente[] = [];
  isLoading = true;
  pacienteSelecionado: Paciente | null = null;
  dropdownAbertoPara: number | null = null;

  constructor(private pacientesService: PacientesService,
              private toastr: ToastrService) {}

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
}
