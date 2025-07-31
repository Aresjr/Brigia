import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';

@Component({
  selector: 'app-pacientes',
  imports: [CommonModule],
  templateUrl: './pacientes.component.html',
  styleUrl: './pacientes.component.scss',
  standalone: true
})
export class PacientesComponent implements OnInit {
  pacientes: Paciente[] = [];
  carregando = true;

  constructor(private pacientesService: PacientesService) {}

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.carregando = true;
    this.pacientesService.listarPacientes().subscribe({
      next: (response) => {
        this.pacientes = response.items;
        this.carregando = false;
      },
      error: () => {
        this.carregando = false;
      }
    });
  }
}
