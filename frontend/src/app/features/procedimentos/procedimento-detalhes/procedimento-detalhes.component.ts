import { Component, EventEmitter, Input, Output, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Procedimento, PrecoProcedimentoConvenio } from '../procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { UserService } from '../../../core/user.service';
import { TIPO_AGENDAMENTO } from '../../agenda-diaria/agendamento.interface';
import { Unidade } from '../../unidade/unidade.interface';

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
  unidadesExpandidas: { [key: number]: boolean } = {};
  conveniosExpandidosPorUnidade: { [key: number]: boolean } = {};
  planosExpandidosPorUnidade: { [key: number]: boolean } = {};
  unidades: Unidade[] = [];
  TIPO_AGENDAMENTO = TIPO_AGENDAMENTO;

  constructor(private userService: UserService) {}

  ngOnInit() {
    this.extrairUnidades();
  }

  extrairUnidades() {
    if (!this.procedimento) return;

    // Extrair unidades únicas dos preços de convênio e planos
    const unidadesMap = new Map<number, Unidade>();

    this.procedimento.precosProcedimento?.forEach(preco => {
      if (preco.unidade) {
        unidadesMap.set(preco.unidade.id, preco.unidade);
      }
    });

    this.procedimento.precosPlanos?.forEach(preco => {
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
    if (!this.procedimento?.precosProcedimento) return [];
    return this.procedimento.precosProcedimento.filter(
      preco => preco.unidade?.id === unidadeId
    );
  }

  getPrecosPlanosPorUnidade(unidadeId: number) {
    if (!this.procedimento?.precosPlanos) return [];
    return this.procedimento.precosPlanos.filter(
      preco => preco.unidade?.id === unidadeId
    );
  }

  exibeEditar() {
    return !this.userService.isMedico();
  }
}
