import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Convenio, ConvenioResponse } from './convenio.interface';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class ConveniosService {
  constructor(private backend: BackendService, private toastr: ToastrService) { }

  path = '/convenios';

  listar(mostrarExcluidos: boolean = false): Observable<ConvenioResponse> {
    return this.backend.get<ConvenioResponse>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=999`).pipe(
      catchError((error) => {
        this.toastr.error('Erro ao carregar convênios. Por favor, tente novamente.');
        return throwError(() => error);
      })
    );
  }

  criar(convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.post<Convenio>(this.path, convenio);
  }

  atualizar(id: number, convenio: Partial<Convenio>): Observable<Convenio> {
    return this.backend.put<Convenio>(`${this.path}/${id}`, convenio);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }
}
