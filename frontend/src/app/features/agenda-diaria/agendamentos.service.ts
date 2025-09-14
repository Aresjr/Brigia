import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';
import { catchError, Observable, throwError } from 'rxjs';
import { StatusAgendamento } from '../../core/constans';

@Injectable({
  providedIn: 'root'
})
export class AgendamentosService extends BaseService<Agendamento, AgendamentoRequest> {

  override path = '/agendamentos';
  override cache$ = null;

  iniciarAtendimento(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<Agendamento>(`${this.path}/${id}`,
      {status: StatusAgendamento.EmAtendimento}).pipe(
      catchError((e) => throwError(() => e))
    );
  }
}
