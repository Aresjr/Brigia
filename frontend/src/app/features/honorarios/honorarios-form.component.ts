import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { NgSelectComponent } from '@ng-select/ng-select';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { AgendamentoService } from '../agenda-diaria/agendamento.service';
import { Agendamento, StatusAgendamentoEnum } from '../agenda-diaria/agendamento.interface';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-honorarios-form',
  templateUrl: './honorarios-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    NgSelectComponent
  ]
})
export class HonorariosFormComponent implements OnInit {
  @Input() profissionalId: number | null = null;
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;
  profissionais: Profissional[] = [];
  agendamentos: Agendamento[] = [];
  agendamentosExpandidos: Set<number> = new Set();
  isLoading: boolean = false;
  hoje: string;

  constructor(
    private fb: FormBuilder,
    private profissionalService: ProfissionalService,
    private agendamentoService: AgendamentoService,
    private toastr: ToastrService,
  ) {
    this.hoje = new Date().toISOString().split('T')[0];
    this.form = this.fb.group({
      profissionalId: [null, Validators.required],
      data: [this.hoje, Validators.required]
    });
  }

  ngOnInit() {
    this.carregarProfissionais();

    // Watch form changes
    this.form.get('profissionalId')?.valueChanges.subscribe(() => {
      this.carregarAgendamentos();
    });

    this.form.get('data')?.valueChanges.subscribe(() => {
      this.carregarAgendamentos();
    });

    // Set initial profissional
    if (this.profissionalId) {
      this.form.patchValue({ profissionalId: this.profissionalId });
    }
  }

  carregarProfissionais() {
    this.profissionalService.listar().subscribe({
      next: (response) => {
        this.profissionais = response.items;
      }
    });
  }

  carregarAgendamentos() {
    const profissionalId = this.form.get('profissionalId')?.value;
    const data = this.form.get('data')?.value;

    if (!profissionalId || !data) {
      this.agendamentos = [];
      return;
    }

    this.isLoading = true;
    // Buscar agendamentos do profissional na data selecionada
    this.agendamentoService.listar().subscribe({
      next: (response) => {
        const dataObj = new Date(data);
        this.agendamentos = response.items.filter(ag => {
          const agData = new Date(ag.data);
          return ag.profissional.id === profissionalId &&
                 agData.toDateString() === dataObj.toDateString()
                  && ag.status == StatusAgendamentoEnum.Finalizado;
        });
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  toggleAgendamento(agendamentoId: number) {
    if (this.agendamentosExpandidos.has(agendamentoId)) {
      this.agendamentosExpandidos.delete(agendamentoId);
    } else {
      this.agendamentosExpandidos.add(agendamentoId);
    }
  }

  isExpandido(agendamentoId: number): boolean {
    return this.agendamentosExpandidos.has(agendamentoId);
  }

  calcularValorAgendamento(agendamento: Agendamento): number {
    let total = agendamento.valor || 0;

    if (agendamento.procedimentos && agendamento.procedimentos.length > 0) {
      agendamento.procedimentos.forEach(proc => {
        total += (proc.procedimento.valorPadrao || 0) * proc.quantidade;
      });
    }

    return total;
  }

  get valorTotal(): number {
    return this.agendamentos.reduce((sum, ag) => sum + this.calcularValorAgendamento(ag), 0);
  }

  fechar() {
    this.cancel.emit();
  }

  gerar() {
    if (!this.form.valid) {
      this.toastr.warning('Verifique as informações preenchidas');
      return;
    }
    // TODO: Implementar geração de honorários
    console.log('Gerar honorários', this.form.value);
  }
}
