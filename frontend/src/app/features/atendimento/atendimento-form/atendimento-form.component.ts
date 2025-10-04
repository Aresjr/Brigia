import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Atendimento, AtendimentoRequest } from '../atendimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { FormComponent } from '../../shared/form.component';
import { ConfirmDialogComponent } from '../../shared/confirm-dialog/confirm-dialog.component';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ProcedimentoService } from '../../procedimentos/procedimento.service';
import { Procedimento } from '../../procedimentos/procedimento.interface';
import { ToastrService } from 'ngx-toastr';

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
export class AtendimentoFormComponent extends FormComponent<Atendimento, AtendimentoRequest> implements OnInit {
  @Input() atendimento: Atendimento | null = null;
  @Input() agendamentoId: number | null = null;
  @Input() atendimentoId: number | null = null;
  titulo: string = 'Novo Atendimento';
  exibeConfirmCancelamento: boolean = false;
  procedimentos: Procedimento[] = [];

  constructor(protected override fb: FormBuilder,
              protected override toastr: ToastrService,
              private procedimentoService: ProcedimentoService) {
    super(fb, toastr);
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

  override ngOnInit() {
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

  carregarProcedimentos() {
    this.procedimentoService.listar().subscribe({
      next: (response) => {
        this.procedimentos = response.items;
      }
    });
  }

  fechar(confirmou: boolean = false) {
    if (!confirmou && this.form.dirty) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }
}
