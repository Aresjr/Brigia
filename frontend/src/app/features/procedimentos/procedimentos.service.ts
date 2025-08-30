import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  PrecoProcedimentoConvenio, Procedimento,
  ProcedimentoRequest,
  TabelaPrecoResponse
} from './procedimento.interface';
import { BaseService } from './base.service';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentosService extends BaseService<Procedimento, ProcedimentoRequest> {

  override path = '/procedimentos';

  listarTabelaPreco(id: number): Observable<TabelaPrecoResponse> {
    return this.backend.get<TabelaPrecoResponse>(`${this.path}/${id}/tabela-preco`);
  }

  atualizarPreco(precoConvenio: PrecoProcedimentoConvenio): Observable<void> {
    this.limparCache();
    return this.backend.patch<PrecoProcedimentoConvenio>(`${this.path}/${precoConvenio.id}/atualizar-preco`, precoConvenio);
  }

  obterPrecoProcedimentoConvenio(idProcedimento: number, idConvenio: number): Observable<PrecoProcedimentoConvenio> {
    return this.backend.get<PrecoProcedimentoConvenio>(`${this.path}/${idProcedimento}/tabela-preco/${idConvenio}`);
  }
}
