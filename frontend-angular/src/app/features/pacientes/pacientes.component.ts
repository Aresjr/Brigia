import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
import {ToastrService} from 'ngx-toastr';

@Component({
  selector: 'app-pacientes',
  imports: [CommonModule],
  templateUrl: './pacientes.component.html',
  styleUrl: './pacientes.component.scss',
  standalone: true
})
export class PacientesComponent implements OnInit {
  pacientes: Paciente[] = [];
  isLoading = true;

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
}
