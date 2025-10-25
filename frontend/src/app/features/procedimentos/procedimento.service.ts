import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  PrecoProcedimentoConvenio,
  PrecoProcedimentoPlano,
  Procedimento,
  ProcedimentoRequest
} from './procedimento.interface';
import { BaseService } from '../shared/base.service';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentoService extends BaseService<Procedimento, ProcedimentoRequest> {

  override path = '/procedimentos';

  obterPrecoProcedimentoConvenio(idProcedimento: number, idConvenio: number): Observable<PrecoProcedimentoConvenio> {
    return this.backend.get<PrecoProcedimentoConvenio>(`${this.path}/${idProcedimento}/tabela-preco/${idConvenio}`);
  }

  obterPrecoProcedimentoPlano(idProcedimento: number, idPlano: number): Observable<PrecoProcedimentoPlano> {
    return this.backend.get<PrecoProcedimentoPlano>(`${this.path}/${idProcedimento}/tabela-preco-plano/${idPlano}`);
  }

  obterPrecosProcedimento(idProcedimento: number): Observable<PrecoProcedimentoConvenio[]> {
    return this.backend.get<PrecoProcedimentoConvenio[]>(`${this.path}/${idProcedimento}/precos-convenio`);
  }

  obterPrecosPlanos(idProcedimento: number): Observable<PrecoProcedimentoPlano[]> {
    return this.backend.get<PrecoProcedimentoPlano[]>(`${this.path}/${idProcedimento}/precos-plano`);
  }
}
