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
          this.toastr.error('Erro ao carregar os registros. Por favor, tente novamente.');
          return throwError(() => error);
        })
      );
    }
    return this.cache$;
  }

  criar(registro: Partial<Y>): Observable<Y> {
    this.limparCache();
    return this.backend.post<Y>(this.path, registro).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao cadastrar o registro.');
        return throwError(() => e);
      })
    );
  }

  atualizar(id: number, procedimento: Partial<Y>): Observable<Y> {
    this.limparCache();
    return this.backend.put<Y>(`${this.path}/${id}`, procedimento).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao atualizar o registro.');
        return throwError(() => e);
      })
    );
  }

  excluir(id: number): Observable<void> {
    this.limparCache();
    return this.backend.delete<void>(`${this.path}/${id}`).pipe(
      catchError((error) => {
        this.toastr.error('Erro ao excluir o registro. Por favor, tente novamente.');
        return throwError(() => error);
      })
    );
  }

  restaurar(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null).pipe(
      catchError((error) => {
        this.toastr.error('Erro ao restaurar o registro. Por favor, tente novamente.');
        return throwError(() => error);
      })
    );
  }

  limparCache() {
    this.cache$ = null;
  }
}
