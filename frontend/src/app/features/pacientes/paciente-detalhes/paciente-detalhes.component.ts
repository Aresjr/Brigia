import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Paciente } from '../paciente.interface';
import { CpfPipe } from '../../../core/pipes/cpf.pipe';
import { CepPipe } from '../../../core/pipes/cep.pipe';
import { CelularPipe } from '../../../core/pipes/celular.pipe';
import { SexoPipe } from '../../../core/pipes/sexo.pipe';
import { LucideAngularModule } from 'lucide-angular';
import { Router } from '@angular/router';

@Component({
  selector: 'app-paciente-detalhes',
  standalone: true,
  imports: [CommonModule, CpfPipe, CepPipe, CelularPipe, SexoPipe, LucideAngularModule],
  templateUrl: './paciente-detalhes.component.html',
})
export class PacienteDetalhesComponent {
  @Input() paciente: Paciente | null = null;
  @Output() fechou = new EventEmitter<void>();

  constructor(private router: Router) {}

  fechar(): void {
    this.fechou.emit();
  }

  criarAgendamento(pacienteId: number) {
    this.router.navigate(['/agenda-diaria'], {
      state: { pacienteId }
    });
  }
}
