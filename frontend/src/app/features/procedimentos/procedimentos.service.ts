import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  PrecoProcedimentoConvenio,
  Procedimento,
  ProcedimentoResponse,
  TabelaPrecoResponse
} from './procedimento.interface';
import { BaseService } from './base.service';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentosService extends BaseService<Procedimento, ProcedimentoResponse> {

  override path = '/procedimentos';

  listarTabelaPreco(id: number): Observable<TabelaPrecoResponse> {
    this.limparCache();
    return this.backend.get<TabelaPrecoResponse>(`${this.path}/${id}/tabela-preco`);
  }

  atualizarPreco(precoConvenio: PrecoProcedimentoConvenio): Observable<void> {
    this.limparCache();
    return this.backend.patch<PrecoProcedimentoConvenio>(`${this.path}/${precoConvenio.id}/atualizar-preco`, precoConvenio);
  }
}
