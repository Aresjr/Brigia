import { Component, EventEmitter, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Procedimento, PrecoProcedimentoConvenio, PrecoProcedimentoPlano } from '../procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { UserService } from '../../../core/user.service';
import { TIPO_AGENDAMENTO } from '../../agenda-diaria/agendamento.interface';
import { Unidade } from '../../unidade/unidade.interface';
import { ProcedimentoService } from '../procedimento.service';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-procedimento-detalhes',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule],
  templateUrl: './procedimento-detalhes.component.html',
})
export class ProcedimentoDetalhesComponent implements OnInit, OnChanges {
  @Input() procedimento: Procedimento | null = null;
  @Output() editar = new EventEmitter<Procedimento>();
  @Output() fechou = new EventEmitter<void>();
  unidadesExpandidas: { [key: number]: boolean } = {};
  conveniosExpandidosPorUnidade: { [key: number]: boolean } = {};
  planosExpandidosPorUnidade: { [key: number]: boolean } = {};
  unidades: Unidade[] = [];
  precosProcedimento: PrecoProcedimentoConvenio[] = [];
  precosPlanos: PrecoProcedimentoPlano[] = [];
  TIPO_AGENDAMENTO = TIPO_AGENDAMENTO;

  constructor(
    private userService: UserService,
    private procedimentoService: ProcedimentoService
  ) {}

  ngOnInit() {
    this.carregarPrecos();
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['procedimento'] && !changes['procedimento'].firstChange) {
      this.carregarPrecos();
    }
  }

  carregarPrecos() {
    if (!this.procedimento?.id) return;

    forkJoin({
      precosProcedimento: this.procedimentoService.obterPrecosProcedimento(this.procedimento.id),
      precosPlanos: this.procedimentoService.obterPrecosPlanos(this.procedimento.id)
    }).subscribe({
      next: (result) => {
        this.precosProcedimento = result.precosProcedimento;
        this.precosPlanos = result.precosPlanos;
        this.extrairUnidades();
      },
      error: (error) => {
        console.error('Erro ao carregar preços:', error);
        this.precosProcedimento = [];
        this.precosPlanos = [];
      }
    });
  }

  extrairUnidades() {
    // Extrair unidades únicas dos preços de convênio e planos
    const unidadesMap = new Map<number, Unidade>();

    this.precosProcedimento?.forEach(preco => {
      if (preco.unidade) {
        unidadesMap.set(preco.unidade.id, preco.unidade);
      }
    });

    this.precosPlanos?.forEach(preco => {
      if (preco.unidade) {
        unidadesMap.set(preco.unidade.id, preco.unidade);
      }
    });

    // Converter para array de unidades
    this.unidades = Array.from(unidadesMap.values());

    // Inicializar estados de expansão
    this.unidades.forEach(unidade => {
      this.unidadesExpandidas[unidade.id] = false;
      this.conveniosExpandidosPorUnidade[unidade.id] = false;
      this.planosExpandidosPorUnidade[unidade.id] = false;
    });
  }

  fechar(): void {
    this.fechou.emit();
  }

  onEditar(procedimento: Procedimento): void {
    this.editar.emit(procedimento);
  }

  toggleUnidade(unidadeId: number) {
    this.unidadesExpandidas[unidadeId] = !this.unidadesExpandidas[unidadeId];
  }

  isUnidadeExpandida(unidadeId: number): boolean {
    return this.unidadesExpandidas[unidadeId] || false;
  }

  toggleConvenios(unidadeId: number) {
    this.conveniosExpandidosPorUnidade[unidadeId] = !this.conveniosExpandidosPorUnidade[unidadeId];
  }

  isConveniosExpandido(unidadeId: number): boolean {
    return this.conveniosExpandidosPorUnidade[unidadeId] || false;
  }

  togglePlanos(unidadeId: number) {
    this.planosExpandidosPorUnidade[unidadeId] = !this.planosExpandidosPorUnidade[unidadeId];
  }

  isPlanosExpandido(unidadeId: number): boolean {
    return this.planosExpandidosPorUnidade[unidadeId] || false;
  }

  getPrecosPorUnidade(unidadeId: number): PrecoProcedimentoConvenio[] {
    if (!this.precosProcedimento) return [];
    return this.precosProcedimento.filter(
      preco => preco.unidade?.id === unidadeId
    );
  }

  getPrecosPlanosPorUnidade(unidadeId: number) {
    if (!this.precosPlanos) return [];
    return this.precosPlanos.filter(
      preco => preco.unidade?.id === unidadeId
    );
  }

  exibeEditar() {
    return !this.userService.isMedico();
  }
}
