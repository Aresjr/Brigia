import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { Honorario } from './honorario.interface';
import { HonorarioService } from './honorario.service';
import { HonorariosFormComponent } from './honorarios-form.component';

@Component({
  selector: 'app-honorarios',
  templateUrl: './honorarios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    HonorariosFormComponent
  ]
})
export class HonorariosComponent implements OnInit {
  honorarios: Honorario[] = [];
  isLoading: boolean = false;
  mostrarFormulario: boolean = false;

  constructor(
    private honorarioService: HonorarioService
  ) {}

  ngOnInit() {
    this.carregarHonorarios();
  }

  carregarHonorarios() {
    this.isLoading = true;
    this.honorarioService.listar().subscribe({
      next: (response) => {
        this.honorarios = response.items;
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  abrirFormulario() {
    this.mostrarFormulario = true;
  }

  fecharFormulario() {
    this.mostrarFormulario = false;
    this.carregarHonorarios();
  }
}
