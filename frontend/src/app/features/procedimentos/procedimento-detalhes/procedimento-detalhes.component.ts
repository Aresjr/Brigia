import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Procedimento } from '../procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { UserService } from '../../../core/user.service';

@Component({
  selector: 'app-procedimento-detalhes',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule],
  templateUrl: './procedimento-detalhes.component.html',
})
export class ProcedimentoDetalhesComponent {
  @Input() procedimento: Procedimento | null = null;
  @Output() editar = new EventEmitter<Procedimento>();
  @Output() fechou = new EventEmitter<void>();
  mostraTabelaConvenio: boolean = false;

  constructor(private userService: UserService) {}

  fechar(): void {
    this.fechou.emit();
  }

  onEditar(procedimento: Procedimento): void {
    this.editar.emit(procedimento);
  }

  toggleTabelaConvenio() {
    this.mostraTabelaConvenio = !this.mostraTabelaConvenio;
  }

  exibeEditar() {
    return !this.userService.isMedico();
  }
}
