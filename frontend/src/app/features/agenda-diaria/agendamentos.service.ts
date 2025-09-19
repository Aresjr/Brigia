import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { PagedResponse } from '../shared/entidade.interface';

@Injectable({
  providedIn: 'root'
})
export class AgendamentosService extends BaseService<Agendamento, AgendamentoRequest> {

  override path = '/agendamentos';

  listarPorData(ano: number, mes: number): Observable<PagedResponse<Agendamento>> {
    return this.backend.get<PagedResponse<Agendamento>>(`${this.path}?ano=${ano}&mes=${mes}&size=9999`).pipe(
      shareReplay(1),
      catchError((e) => {
        this.toastr.error('Erro ao carregar os registros. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }

  getByToken(token: string): Observable<Agendamento> {
    return this.backend.get<Agendamento>(`${this.path}/token/${token}`).pipe(
      shareReplay(1),
      catchError((e) => {

        console.log('e', e);

        return throwError(() => e);
      })
    );
  }

}
