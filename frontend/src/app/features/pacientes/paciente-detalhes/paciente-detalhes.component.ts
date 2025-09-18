import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Paciente } from '../paciente.interface';
import { CpfPipe } from '../../../core/pipes/cpf.pipe';
import { CepPipe } from '../../../core/pipes/cep.pipe';
import { CelularPipe } from '../../../core/pipes/celular.pipe';
import { SexoPipe } from '../../../core/pipes/sexo.pipe';
import { LucideAngularModule } from 'lucide-angular';
import { Router } from '@angular/router';
import { UserService } from '../../../core/user.service';

@Component({
  selector: 'app-paciente-detalhes',
  standalone: true,
  imports: [CommonModule, CpfPipe, CepPipe, CelularPipe, SexoPipe, LucideAngularModule],
  templateUrl: './paciente-detalhes.component.html',
})
export class PacienteDetalhesComponent {
  @Input() paciente: Paciente | null = null;
  @Output() fechou = new EventEmitter<void>();
  @Output() editou = new EventEmitter<Paciente | null>();

  constructor(private router: Router, private userService: UserService) {}

  fechar(): void {
    this.fechou.emit();
  }

  criarAgendamento(pacienteId: number) {
    this.router.navigate(['/agenda-diaria'], {
      state: { pacienteId }
    });
  }

  exibeCriarAgendamento() {
    return !this.userService.isMedico();
  }

  editar(paciente: Paciente | null) {
    this.editou.emit(paciente);
  }
}
