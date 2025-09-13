import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Procedimento, PrecoProcedimentoConvenio } from '../procedimento.interface';
import { ProcedimentosService } from '../procedimentos.service';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { UserService } from '../../../core/user.service';

@Component({
  selector: 'app-procedimento-detalhes',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule],
  templateUrl: './procedimento-detalhes.component.html',
})
export class ProcedimentoDetalhesComponent implements OnInit {
  @Input() procedimento: Procedimento | null = null;
  @Output() editar = new EventEmitter<Procedimento>();
  @Output() fechou = new EventEmitter<void>();
  precosProcedimento: PrecoProcedimentoConvenio[] | undefined = undefined;
  mostraTabelaConvenio: boolean = false;

  constructor(private procedimentosService: ProcedimentosService,
              private userService: UserService) {}

  ngOnInit(): void {
    if (this.procedimento) {
      this.procedimentosService.listarPrecosProcedimento(this.procedimento.id).subscribe({
        next: (response) => {
          this.precosProcedimento = response.tabelaConvenio;
        }
      });
    }
  }

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
