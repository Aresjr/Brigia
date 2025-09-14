import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Atendimento, AtendimentoRequest } from '../atendimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { ConfirmDialogComponent } from '../../shared/confirm-dialog/confirm-dialog.component';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ProcedimentosService } from '../../procedimentos/procedimentos.service';
import { Procedimento } from '../../procedimentos/procedimento.interface';

@Component({
  selector: 'app-atendimento-form',
  templateUrl: './atendimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    ConfirmDialogComponent,
    NgSelectComponent,
    NgOptionComponent,
    NgNotFoundTemplateDirective
  ]
})
export class AtendimentoFormComponent extends FormComponent<AtendimentoRequest> implements OnInit {
  @Input() atendimento: Atendimento | null = null;
  @Input() agendamentoId: number | null = null;
  titulo: string = 'Novo Atendimento';
  exibeConfirmCancelamento: boolean = false;
  procedimentos: Procedimento[] = [];

  constructor(protected override fb: FormBuilder,
              private procedimentosService: ProcedimentosService) {
    super(fb);
    this.form = this.fb.group({
      anamnese: [null],
      exameFisico: [null],
      diagnostico: [null],
      evolucaoClinica: [null],
      examesSolicitados: [null],
      prescricoes: [null],
      observacoes: [null],
      agendamentoId: [null],
      horaInicio: [null],
      procedimentos: this.fb.array([])
    });
  }

  ngOnInit() {
    this.carregarProcedimentos();
    if (this.atendimento) {
      this.form.patchValue(this.atendimento);
    }

    const horaAtual = new Date().toLocaleTimeString("pt-BR", {
      hour: "2-digit",
      minute: "2-digit",
      hour12: false
    });
    this.form.patchValue({
      agendamentoId: this.agendamentoId,
      horaInicio: horaAtual
    });
  }

  get procedimentosLancados() {
    return this.form.get('procedimentos') as FormArray;
  }

  adicionarProcedimento() {
    const procedimento = this.fb.group({
      quantidade: [1, [Validators.required, Validators.min(1)]],
      procedimentoId: [null, Validators.required],
      valor: [null]
    });

    this.procedimentosLancados.push(procedimento);
  }

  removerProcedimento(index: number) {
    this.procedimentosLancados.removeAt(index);
  }

  carregarProcedimentos() {
    this.procedimentosService.listar().subscribe({
      next: (response) => {
        this.procedimentos = response.items;
      }
    });
  }

  atualizarValorProcedimento(index: number, procedimentoId: number) {
    const procedimento = this.procedimentos.find(p => p.id === procedimentoId);
    if (procedimento) {
      const valor = procedimento.valorPadrao || 0;
      const quantidade = this.procedimentosLancados.at(index).get('quantidade')?.value || 1;
      this.procedimentosLancados.at(index).patchValue({
        valor: valor * quantidade
      });
    }
  }

  atualizarValorPorQuantidade(index: number) {
    const procedimentoId = this.procedimentosLancados.at(index).get('procedimentoId')?.value;
    if (procedimentoId) {
      this.atualizarValorProcedimento(index, procedimentoId);
    }
  }

  fechar(confirmou: boolean = false) {
    if (!confirmou && this.form.dirty) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }
}
