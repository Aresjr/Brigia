import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  PrecoProcedimentoConvenio, Procedimento,
  ProcedimentoRequest
} from './procedimento.interface';
import { BaseService } from './base.service';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentoService extends BaseService<Procedimento, ProcedimentoRequest> {

  override path = '/procedimentos';

  obterPrecoProcedimentoConvenio(idProcedimento: number, idConvenio: number): Observable<PrecoProcedimentoConvenio> {
    return this.backend.get<PrecoProcedimentoConvenio>(`${this.path}/${idProcedimento}/tabela-preco/${idConvenio}`);
  }
}
