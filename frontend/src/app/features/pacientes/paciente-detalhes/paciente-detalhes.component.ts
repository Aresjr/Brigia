import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Paciente } from '../paciente.interface';
import { SEXOS } from '../../../core/constans';

@Component({
  selector: 'app-paciente-detalhes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './pacientes-detalhes.component.html',
})
export class PacienteDetalhesComponent {
  @Input() paciente: Paciente | null = null;
  @Output() fechou = new EventEmitter<void>();

  fechar(): void {
    this.fechou.emit();
  }

  descricaoSexo(sigla: string | null) {
    return SEXOS.find(sexo => sexo.sigla === sigla)?.descricao || 'Desconhecido';
  }
}
