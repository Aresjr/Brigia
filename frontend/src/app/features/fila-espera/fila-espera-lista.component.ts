import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FilaEspera } from './fila-espera.interface';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-fila-espera-lista',
  standalone: true,
  imports: [CommonModule, LucideAngularModule],
  templateUrl: './fila-espera-lista.component.html',
  styleUrls: ['./fila-espera-lista.component.css']
})
export class FilaEsperaListaComponent {
  @Input() filaEspera: FilaEspera[] = [];
  @Input() isLoading: boolean = false;
  @Output() recarrega = new EventEmitter<void>();
  @Output() editar = new EventEmitter<FilaEspera>();
  @Output() remover = new EventEmitter<FilaEspera>();
  @Output() criarAgendamento = new EventEmitter<FilaEspera>();

  onEditar(item: FilaEspera) {
    this.editar.emit(item);
  }

  onRemover(item: FilaEspera) {
    this.remover.emit(item);
  }

  onCriarAgendamento(item: FilaEspera) {
    this.criarAgendamento.emit(item);
  }

  recarregar() {
    this.recarrega.emit();
  }
}
