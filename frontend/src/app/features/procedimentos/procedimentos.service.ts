import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Procedimento, ProcedimentoResponse } from './procedimento.interface';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentosService {
  constructor(private backend: BackendService) {}

  listar(): Observable<ProcedimentoResponse> {
    return this.backend.get<ProcedimentoResponse>('/procedimentos?size=999');
  }

  criar(procedimento: Partial<Procedimento>): Observable<Procedimento> {
    return this.backend.post<Procedimento>('/procedimentos', procedimento);
  }

  atualizar(id: number, procedimento: Partial<Procedimento>): Observable<Procedimento> {
    return this.backend.put<Procedimento>(`/procedimentos/${id}`, procedimento);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`/procedimentos/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`/procedimentos/${id}/restaurar`, null);
  }
}
