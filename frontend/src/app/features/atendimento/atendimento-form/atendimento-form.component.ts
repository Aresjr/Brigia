import { Component, Input, OnInit } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Atendimento, AtendimentoRequest } from '../atendimento.interface';
import { FormComponent } from '../../shared/form.component';
import { ConfirmDialogComponent } from '../../shared/confirm-dialog/confirm-dialog.component';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ProcedimentoService } from '../../procedimentos/procedimento.service';
import { Procedimento } from '../../procedimentos/procedimento.interface';
import { ToastrService } from 'ngx-toastr';
import { AgendamentoService } from '../../agenda-diaria/agendamento.service';
import { Agendamento } from '../../agenda-diaria/agendamento.interface';
import { QuillModule } from 'ngx-quill';
import { StatusAtendimento } from '../../../core/constans';

@Component({
  selector: 'app-atendimento-form',
  templateUrl: './atendimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    ConfirmDialogComponent,
    NgSelectComponent,
    NgOptionComponent,
    NgNotFoundTemplateDirective,
    DatePipe,
    QuillModule
  ]
})
export class AtendimentoFormComponent extends FormComponent<Atendimento, AtendimentoRequest> implements OnInit {
  @Input() atendimento: Atendimento | null = null;
  @Input() atendimentoDetalhes: Atendimento | null = null;
  @Input() agendamentoId: number | null = null;
  @Input() atendimentoId: number | null = null;
  titulo: string = 'Novo Atendimento';
  exibeConfirmCancelamento: boolean = false;
  procedimentos: Procedimento[] = [];
  agendamento: Agendamento | null = null;
  readonly: boolean = false;
  modoSalvar: boolean = true;
  abaAtiva: string = 'anamnese';

  quillModules = {
    toolbar: [
      ['bold', 'italic', 'underline', 'strike'],
      ['blockquote', 'code-block'],
      [{ 'list': 'ordered'}, { 'list': 'bullet' }],
      [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
      [{ 'color': [] }, { 'background': [] }],
      ['clean']
    ]
  };

  constructor(protected override fb: FormBuilder,
              protected override toastr: ToastrService,
              private procedimentoService: ProcedimentoService,
              private agendamentoService: AgendamentoService) {
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

    // Modo detalhes/edição
    if (this.atendimentoDetalhes) {
      this.readonly = true;
      this.modoSalvar = false;
      this.titulo = 'Detalhes do Atendimento';
      this.form.patchValue(this.atendimentoDetalhes);
      this.form.disable();

      // Carregar agendamento para exibir informações do paciente
      if (this.atendimentoDetalhes.agendamento?.id) {
        this.agendamentoService.getById(this.atendimentoDetalhes.agendamento.id).subscribe({
          next: (agendamento) => {
            this.agendamento = agendamento;
            // Carregar procedimentos do agendamento
            if (agendamento.procedimentos && agendamento.procedimentos.length > 0) {
              agendamento.procedimentos.forEach(proc => {
                const procedimento = this.fb.group({
                  quantidade: [proc.quantidade],
                  procedimentoId: [proc.procedimento.id]
                });
                this.procedimentosLancados.push(procedimento);
              });
            }
          }
        });
      }
      return;
    }

    // Modo novo/edição
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

    // Carregar dados do agendamento
    if (this.agendamentoId) {
      this.agendamentoService.getById(this.agendamentoId).subscribe({
        next: (agendamento) => {
          this.agendamento = agendamento;
          // Carregar procedimentos do agendamento
          if (agendamento.procedimentos && agendamento.procedimentos.length > 0) {
            agendamento.procedimentos.forEach(proc => {
              const procedimento = this.fb.group({
                quantidade: [proc.quantidade],
                procedimentoId: [proc.procedimento.id]
              });
              this.procedimentosLancados.push(procedimento);
            });
          }
        }
      });
    }
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

  habilitarEdicao() {
    this.readonly = false;
    this.modoSalvar = true;
    this.titulo = 'Continuar Atendimento';
    this.form.enable();
  }

  podeEditar(): boolean {
    return this.readonly && this.atendimentoDetalhes?.status !== 2; // Não finalizado
  }

  selecionarAba(aba: string) {
    this.abaAtiva = aba;
  }

  protected readonly StatusAtendimento = StatusAtendimento;
}
