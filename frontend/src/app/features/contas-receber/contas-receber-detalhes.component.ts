import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { NgClass, NgIf } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ContaReceber } from './contas-receber.interface';
import { StatusContaReceber } from '../../core/constans';

@Component({
  selector: 'app-contas-receber-detalhes',
  templateUrl: './contas-receber-detalhes.component.html',
  imports: [
    ReactiveFormsModule, NgClass,
    LucideAngularModule, NgIf
  ]
})
export class AgendamentoFormComponent implements OnInit {
  @Input() contaReceber: ContaReceber | null = null;
  @Output() fechou = new EventEmitter<void>();

  constructor() {}

  ngOnInit(): void {
    console.log('contaReceber', this.contaReceber);
  }

  fechar(): void {
    this.fechou.emit();
  }

  protected readonly StatusContaReceber = StatusContaReceber;
}
