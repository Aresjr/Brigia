import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  PrecoProcedimentoConvenio, Procedimento,
  ProcedimentoRequest,
  PrecosProcedimentoResponse
} from './procedimento.interface';
import { BaseService } from './base.service';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentosService extends BaseService<Procedimento, ProcedimentoRequest> {

  override path = '/procedimentos';

  listarPrecosProcedimento(id: number): Observable<PrecosProcedimentoResponse> {
    return this.backend.get<PrecosProcedimentoResponse>(`${this.path}/${id}/tabela-preco`);
  }

  obterPrecoProcedimentoConvenio(idProcedimento: number, idConvenio: number): Observable<PrecoProcedimentoConvenio> {
    return this.backend.get<PrecoProcedimentoConvenio>(`${this.path}/${idProcedimento}/tabela-preco/${idConvenio}`);
  }
}
