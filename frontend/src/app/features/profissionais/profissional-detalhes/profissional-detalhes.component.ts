import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Profissional } from '../profissional.interface';
import { CpfPipe } from '../../../core/pipes/cpf.pipe';
import { CelularPipe } from '../../../core/pipes/celular.pipe';
import { SexoPipe } from '../../../core/pipes/sexo.pipe';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-profissional-detalhes',
  standalone: true,
  imports: [CommonModule, CpfPipe, CelularPipe, SexoPipe, LucideAngularModule],
  templateUrl: './profissional-detalhes.component.html',
})
export class ProfissionalDetalhesComponent {
  @Input() profissional: Profissional | null = null;
  @Output() fechou = new EventEmitter<void>();

  fechar(): void {
    this.fechou.emit();
  }
}
