import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule, CurrencyPipe } from '@angular/common';
import { Profissional } from '../profissional.interface';
import { CpfPipe } from '../../../core/pipes/cpf.pipe';
import { CelularPipe } from '../../../core/pipes/celular.pipe';
import { SexoPipe } from '../../../core/pipes/sexo.pipe';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-profissional-detalhes',
  standalone: true,
  imports: [CommonModule, CpfPipe, CelularPipe, SexoPipe, LucideAngularModule, CurrencyPipe],
  templateUrl: './profissional-detalhes.component.html',
})
export class ProfissionalDetalhesComponent {
  @Input() profissional: Profissional | null = null;
  @Output() fechou = new EventEmitter<void>();
  @Output() editou = new EventEmitter<Profissional>();

  fechar(): void {
    this.fechou.emit();
  }

  editar(): void {
    if (this.profissional) {
      this.editou.emit(this.profissional);
    }
  }
}
