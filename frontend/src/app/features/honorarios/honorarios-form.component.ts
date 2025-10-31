import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators, FormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { NgSelectComponent } from '@ng-select/ng-select';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { AgendamentoService } from '../agenda-diaria/agendamento.service';
import { Agendamento } from '../agenda-diaria/agendamento.interface';
import { ToastrService } from 'ngx-toastr';
import { HonorarioService } from './honorario.service';
import { Honorario } from './honorario.interface';
import { abrirDatePicker } from '../../core/util-methods';
import { DisponibilidadeService } from '../disponibilidade/disponibilidade.service';
import { AgendaSemanalService } from '../agenda-semanal/agenda-semanal.service';
import { NgxMaskDirective } from 'ngx-mask';

@Component({
  selector: 'app-honorarios-form',
  templateUrl: './honorarios-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    LucideAngularModule,
    NgSelectComponent,
    NgxMaskDirective
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
  valorAdicionalCalculado: number = 0;
  valorHoraCalculado: number = 0;
  valorHoraEditavel: boolean = false;
  valorHoraAntesEdicao: number = 0;
  profissionalSelecionado: Profissional | null = null;

  constructor(
    private fb: FormBuilder,
    private profissionalService: ProfissionalService,
    private agendamentoService: AgendamentoService,
    private toastr: ToastrService,
    private honorarioService: HonorarioService,
    private disponibilidadeService: DisponibilidadeService,
    private agendaSemanalService: AgendaSemanalService
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
      this.form.get('profissionalId')?.valueChanges.subscribe((profissionalId) => {
        this.profissionalSelecionado = this.profissionais.find(p => p.id === profissionalId) || null;
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
        // Atualizar profissional selecionado se já tiver um ID
        const profissionalId = this.form.get('profissionalId')?.value;
        if (profissionalId) {
          this.profissionalSelecionado = this.profissionais.find(p => p.id === profissionalId) || null;
        }
      }
    });
  }

  carregarAgendamentos() {
    const profissionalId = this.form.get('profissionalId')?.value;
    const data = this.form.get('data')?.value;

    if (!profissionalId || !data) {
      this.agendamentos = [];
      this.valorAdicionalCalculado = 0;
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

        // Buscar valor adicional
        if (this.agendamentos.length > 0) {
          this.buscarValorAdicional(profissionalId, data, this.agendamentos[0].hora);
        } else {
          this.valorAdicionalCalculado = 0;
        }

        // Calcular valor por hora
        this.calcularValorHora();

        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  buscarValorAdicional(profissionalId: number, data: string, hora: string) {
    // Buscar na disponibilidade diária
    this.disponibilidadeService.listar().subscribe({
      next: (responseDisp) => {
        // Filtrar TODAS as disponibilidades do dia para o profissional
        const disponibilidades = responseDisp.items.filter(d =>
          d.profissional.id === profissionalId &&
          d.dia === data
        );

        // Somar todos os valores adicionais das disponibilidades do dia
        const valorDiario = disponibilidades.reduce((sum, d) => sum + (d.valorAdicional || 0), 0);

        // Buscar também na agenda semanal e somar
        // IMPORTANTE: Adicionar 'T00:00:00' para evitar problemas de timezone
        const dataObj = new Date(data + 'T00:00:00');
        const diaSemana = dataObj.getDay(); // 0=Domingo, 6=Sábado

        this.agendaSemanalService.listarPorProfissional(profissionalId).subscribe({
          next: (responseAgenda) => {

            // Somar TODAS as agendas semanais do dia
            const valorSemanal = responseAgenda
              .filter(a => a.diaSemana === diaSemana)
              .reduce((sum, a) => sum + (a.valorAdicional || 0), 0);

            // Total = disponibilidades diárias + agendas semanais
            this.valorAdicionalCalculado = valorDiario + valorSemanal;
          },
          error: () => {
            // Se erro ao buscar agenda semanal, usar apenas valor diário
            this.valorAdicionalCalculado = valorDiario;
          }
        });
      },
      error: () => {
        // Se erro ao buscar disponibilidades, tentar apenas agenda semanal
        const dataObj = new Date(data + 'T00:00:00');
        const diaSemana = dataObj.getDay();

        this.agendaSemanalService.listarPorProfissional(profissionalId).subscribe({
          next: (responseAgenda) => {
            const valorSemanal = responseAgenda
              .filter(a => a.diaSemana === diaSemana)
              .reduce((sum, a) => sum + (a.valorAdicional || 0), 0);

            this.valorAdicionalCalculado = valorSemanal;
          },
          error: () => {
            this.valorAdicionalCalculado = 0;
          }
        });
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

  get valorAdicional(): number {
    // Se está em modo detalhes, retorna o valor do honorário
    if (this.modoDetalhes && this.honorario) {
      return this.honorario.valorAdicional || 0;
    }
    // Se está gerando novo honorário, retorna o valor calculado
    return this.valorAdicionalCalculado;
  }

  get totalHorasTrabalhadas(): number {
    if (this.agendamentos.length === 0) return 0;

    let totalMinutos = 0;
    this.agendamentos.forEach(ag => {
      totalMinutos += ag.duracao || 0;
    });

    return totalMinutos / 60; // Converter minutos em horas
  }

  calcularValorHora() {
    if (!this.profissionalSelecionado?.valorHora) {
      this.valorHoraCalculado = 0;
      return;
    }

    const horas = this.totalHorasTrabalhadas;
    this.valorHoraCalculado = horas * this.profissionalSelecionado.valorHora;
    this.valorHoraAntesEdicao = this.valorHoraCalculado;
  }

  editarValorHora() {
    this.valorHoraEditavel = true;
  }

  cancelarEdicaoValorHora() {
    this.valorHoraEditavel = false;
    this.valorHoraCalculado = this.valorHoraAntesEdicao;
  }

  get valorTotalFinal(): number {
    let total = this.valorTotal + this.valorAdicional;

    // Adicionar valor por hora se existir
    if (this.profissionalSelecionado?.valorHora && !this.modoDetalhes) {
      total += this.valorHoraCalculado;
    } else if (this.modoDetalhes && this.honorario?.valorHora) {
      total += this.honorario.valorHora;
    }

    return total;
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

    const request = {
      ...this.form.value,
      valorHora: this.profissionalSelecionado?.valorHora ? this.valorHoraCalculado : null
    };

    this.isLoading = true;
    this.honorarioService.criar(request).subscribe({
      next: () => {
        this.toastr.success('Honorário gerado com sucesso');
        this.fechar();
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  protected readonly abrirDatePicker = abrirDatePicker;
}
