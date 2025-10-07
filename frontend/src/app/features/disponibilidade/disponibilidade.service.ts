import { Injectable } from '@angular/core';
import { Disponibilidade, DisponibilidadeRequest } from './disponibilidade.interface';
import { BaseService } from '../procedimentos/base.service';
import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { PagedResponse } from '../shared/entidade.interface';

@Injectable({
  providedIn: 'root'
})
export class DisponibilidadeService extends BaseService<Disponibilidade, DisponibilidadeRequest> {

  override path = '/disponibilidades';

  listarPorData(ano: number, mes: number): Observable<PagedResponse<Disponibilidade>> {
    return this.backend.get<PagedResponse<Disponibilidade>>(`${this.path}?ano=${ano}&mes=${mes}&size=9999`).pipe(
      shareReplay(1),
      catchError((e) => {
        this.toastr.error('Erro ao carregar as disponibilidades. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }
}
