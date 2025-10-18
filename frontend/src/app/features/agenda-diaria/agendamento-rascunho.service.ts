import { Injectable } from '@angular/core';

interface AgendamentoRascunho {
  pacienteId: number | null;
  profissionalId: number | null;
  empresaId: number | null;
  especialidadeId: number | null;
  convenioId: number | null;
  procedimentoId: number | null;
  data: string | null;
  horaInicio: string | null;
  duracao: number | null;
  tipoAgendamento: number | null;
  formaPagamento: number | null;
  valor: number | null;
  desconto: number | null;
  observacoes: string | null;
  pago: boolean;
  quantiaPaga: number | null;
  encaixe: boolean;
  procedimentos: Array<{
    procedimentoId: number;
    quantidade: number;
    valor: number;
  }>;
  timestamp: number;
}

@Injectable({
  providedIn: 'root'
})
export class AgendamentoRascunhoService {
  private readonly STORAGE_KEY = 'agendamento_rascunho';
  private readonly EXPIRATION_DAYS = 7; // Rascunho expira após 7 dias

  salvarRascunho(formData: any): void {
    const rascunho: AgendamentoRascunho = {
      pacienteId: formData.pacienteId,
      profissionalId: formData.profissionalId,
      empresaId: formData.empresaId,
      especialidadeId: formData.especialidadeId,
      convenioId: formData.convenioId,
      procedimentoId: formData.procedimentoId,
      data: formData.data,
      horaInicio: formData.hora,
      duracao: formData.duracao,
      tipoAgendamento: formData.tipoAgendamento,
      formaPagamento: formData.formaPagamento,
      valor: formData.valor,
      desconto: formData.desconto,
      observacoes: formData.observacoes,
      pago: formData.pago,
      quantiaPaga: formData.quantiaPaga,
      encaixe: formData.encaixe,
      procedimentos: formData.procedimentos || [],
      timestamp: Date.now()
    };

    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(rascunho));
  }

  carregarRascunho(): AgendamentoRascunho | null {
    const rascunhoStr = localStorage.getItem(this.STORAGE_KEY);

    if (!rascunhoStr) {
      return null;
    }

    try {
      const rascunho: AgendamentoRascunho = JSON.parse(rascunhoStr);

      // Verificar se o rascunho expirou
      const diasPassados = (Date.now() - rascunho.timestamp) / (1000 * 60 * 60 * 24);
      if (diasPassados > this.EXPIRATION_DAYS) {
        this.limparRascunho();
        return null;
      }

      return rascunho;
    } catch (error) {
      console.error('Erro ao carregar rascunho:', error);
      this.limparRascunho();
      return null;
    }
  }

  limparRascunho(): void {
    localStorage.removeItem(this.STORAGE_KEY);
  }

  existeRascunho(): boolean {
    return this.carregarRascunho() !== null;
  }
}
