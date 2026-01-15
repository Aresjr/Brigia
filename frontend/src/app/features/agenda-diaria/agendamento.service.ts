import { Injectable } from '@angular/core';
import { BaseService } from '../shared/base.service';
import { Agendamento, AgendamentoDetalhes, AgendamentoRequest } from './agendamento.interface';
import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { PagedResponse } from '../shared/entidade.interface';
import { Usuario } from '../usuarios/usuario.interface';

@Injectable({
  providedIn: 'root'
})
export class AgendamentoService extends BaseService<Agendamento, AgendamentoRequest> {

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

  getByToken(token: string): Observable<AgendamentoDetalhes> {
    return this.backend.get<AgendamentoDetalhes>(`${this.path}/token/${token}`).pipe(
      shareReplay(1),
      catchError((e) => {

        console.log('e', e);

        return throwError(() => e);
      })
    );
  }

  cancelarPorToken(token: string): Observable<void> {
    return this.backend.patch<void>(`${this.path}/token/${token}/cancelar`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || 'Erro ao cancelar agendamento';
        this.toastr.error(errorMessage);
        return throwError(() => e);
      })
    );
  }

  marcarNaoCompareceu(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/nao-compareceu`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || 'Erro ao marcar como não compareceu';
        this.toastr.error(errorMessage);
        return throwError(() => e);
      })
    );
  }

  marcarCanceladoPeloUsuario(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/cancelado-pelo-usuario`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || 'Erro ao marcar como cancelado pelo usuário';
        this.toastr.error(errorMessage);
        return throwError(() => e);
      })
    );
  }
}
