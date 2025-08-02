import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Convenio, ConvenioResponse } from './convenio.interface';

@Injectable({
  providedIn: 'root'
})
export class ConveniosService {
  constructor(private backend: BackendService) {}

  listarConvenios(): Observable<ConvenioResponse> {
    return this.backend.get<ConvenioResponse>('/convenios?size=999');
  }

  criarConvenio(convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.post<Convenio>('/convenios', convenio);
  }

  atualizarConvenio(id: number, convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.put<Convenio>(`/convenios/${id}`, convenio);
  }

  excluirConvenio(id: number): Observable<void> {
    return this.backend.delete<void>(`/convenios/${id}`);
  }
}
