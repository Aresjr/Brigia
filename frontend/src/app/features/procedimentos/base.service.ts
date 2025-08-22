import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class BaseService<Y, T> {

  constructor(protected backend: BackendService, protected toastr: ToastrService) {}

  path = '/';
  cache$: Observable<T> | null = null;

  listar(mostrarExcluidos: boolean = false): Observable<T> {
    if (!this.cache$) {
      this.cache$ = this.backend.get<T>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=999`).pipe(
        shareReplay(1),
        catchError((error) => {
          this.toastr.error('Erro ao carregar registros. Por favor, tente novamente.');
          return throwError(() => error);
        })
      );
    }
    return this.cache$;
  }

  criar(registro: Partial<Y>): Observable<Y> {
    this.limparCache();
    return this.backend.post<Y>(this.path, registro);
  }

  atualizar(id: number, procedimento: Partial<Y>): Observable<Y> {
    this.limparCache();
    return this.backend.put<Y>(`${this.path}/${id}`, procedimento);
  }

  excluir(id: number): Observable<void> {
    this.limparCache();
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }

  limparCache() {
    this.cache$ = null;
  }
}
