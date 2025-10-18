import { Injectable } from '@angular/core';
import { AgendaSemanal, AgendaSemanalRequest } from './agenda-semanal.interface';
import { BaseService } from '../shared/base.service';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AgendaSemanalService extends BaseService<AgendaSemanal, AgendaSemanalRequest> {

  override path = '/agendas-semanais';

  listarPorProfissional(profissionalId: number | null): Observable<AgendaSemanal[]> {
    const params = profissionalId ? `?profissionalId=${profissionalId}` : '';
    return this.backend.get<AgendaSemanal[]>(`${this.path}${params}`).pipe(
      catchError((e) => {
        this.toastr.error('Erro ao carregar as agendas semanais. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }
}
