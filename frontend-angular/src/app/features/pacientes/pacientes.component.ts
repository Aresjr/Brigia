import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
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
}
