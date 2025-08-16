import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Paciente } from '../paciente.interface';
import { CpfPipe } from '../../../core/pipes/cpf.pipe';
import { CepPipe } from '../../../core/pipes/cep.pipe';
import { CelularPipe } from '../../../core/pipes/celular.pipe';
import { SexoPipe } from '../../../core/pipes/sexo.pipe';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-paciente-detalhes',
  standalone: true,
  imports: [CommonModule, CpfPipe, CepPipe, CelularPipe, SexoPipe, LucideAngularModule],
  templateUrl: './paciente-detalhes.component.html',
})
export class PacienteDetalhesComponent {
  @Input() paciente: Paciente | null = null;
  @Output() fechou = new EventEmitter<void>();

  fechar(): void {
    this.fechou.emit();
  }
}
