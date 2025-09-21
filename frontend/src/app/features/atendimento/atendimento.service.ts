import { Injectable } from '@angular/core';
import { Atendimento, AtendimentoRequest } from './atendimento.interface';
import { BaseService } from '../procedimentos/base.service';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AtendimentoService extends BaseService<Atendimento, AtendimentoRequest> {

  override path = '/atendimentos';

  iniciarAtendimento(agendamentoId: number): Observable<Atendimento> {
    this.limparCache();
    return this.backend.post<null, Atendimento>(`${this.path}/iniciar-atendimento/${agendamentoId}`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao iniciar o atendimento.');
        return throwError(() => e);
      })
    );
  }

  finalizarAtendimento(atendimentoId: number, request: Partial<AtendimentoRequest>): Observable<Atendimento> {
    this.limparCache();
    return this.backend.post<AtendimentoRequest, Atendimento>(`${this.path}/finalizar-atendimento/${atendimentoId}`, request).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao finalizar o atendimento.');
        return throwError(() => e);
      })
    );
  }
}
