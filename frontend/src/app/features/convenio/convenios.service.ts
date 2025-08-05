import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Convenio, ConvenioResponse } from './convenio.interface';

@Injectable({
  providedIn: 'root'
})
export class ConveniosService {
  constructor(private backend: BackendService) {}

  listar(): Observable<ConvenioResponse> {
    return this.backend.get<ConvenioResponse>('/convenios?size=999');
  }

  criar(convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.post<Convenio>('/convenios', convenio);
  }

  atualizar(id: number, convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.put<Convenio>(`/convenios/${id}`, convenio);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`/convenios/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`/convenios/${id}/restaurar`, null);
  }
}
