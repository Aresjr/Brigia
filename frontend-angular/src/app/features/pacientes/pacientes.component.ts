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
  styleUrl: './pacientes.component.scss',
  standalone: true
})
export class PacientesComponent implements OnInit {
  pacientes: Paciente[] = [];
  isLoading = true;
  pacienteSelecionado: Paciente | null = null;

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
      error: () => {
        this.toastr.error('Erro ao carregar Pacientes');
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
