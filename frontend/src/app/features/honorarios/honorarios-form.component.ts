import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { NgSelectComponent } from '@ng-select/ng-select';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { AgendamentoService } from '../agenda-diaria/agendamento.service';
import { Agendamento } from '../agenda-diaria/agendamento.interface';
import { ToastrService } from 'ngx-toastr';
import { HonorarioService } from './honorario.service';
import { Honorario } from './honorario.interface';

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
  @Input() honorario: Honorario | null = null; // Modo detalhes
  @Output() cancel = new EventEmitter<void>();

  form: FormGroup;
  profissionais: Profissional[] = [];
  agendamentos: Agendamento[] = [];
  agendamentosExpandidos: Set<number> = new Set();
  isLoading: boolean = false;
  hoje: string;
  modoDetalhes: boolean = false;

  constructor(
    private fb: FormBuilder,
    private profissionalService: ProfissionalService,
    private agendamentoService: AgendamentoService,
    private toastr: ToastrService,
    private honorarioService: HonorarioService
  ) {
    this.hoje = new Date().toISOString().split('T')[0];
    this.form = this.fb.group({
      profissionalId: [null, Validators.required],
      data: [this.hoje, Validators.required]
    });
  }

  ngOnInit() {
    // Verificar se está em modo detalhes
    if (this.honorario) {
      this.modoDetalhes = true;
      this.form.patchValue({
        profissionalId: this.honorario.profissional.id,
        data: this.honorario.data
      });
      this.form.disable();
      this.carregarProfissionais();
      this.carregarAgendamentos();
    } else {
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
                 agData.toDateString() === dataObj.toDateString();
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
    // Usar o valor de repasse do procedimento principal
    let total = 0;
    if (agendamento.procedimento) {
      total = agendamento.procedimento.valorRepasse || 0;
    }

    // Somar os valores de repasse dos procedimentos secundários
    if (agendamento.procedimentos && agendamento.procedimentos.length > 0) {
      agendamento.procedimentos.forEach(proc => {
        total += (proc.valorRepasse || 0) * proc.quantidade;
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

    if (this.agendamentos.length === 0) {
      this.toastr.warning('Não há atendimentos para gerar honorário');
      return;
    }

    this.isLoading = true;
    this.honorarioService.criar(this.form.value).subscribe({
      next: () => {
        this.toastr.success('Honorário gerado com sucesso');
        this.fechar();
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }
}
