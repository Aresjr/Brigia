import { catchError, map, Observable, shareReplay, throwError } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';
import { Injectable } from '@angular/core';
import { Entidade, EntidadeResponse } from '../shared/entidade.interface';

@Injectable({
  providedIn: 'root'
})
export class BaseService<T extends Entidade, Y extends EntidadeResponse> {

  constructor(protected backend: BackendService, protected toastr: ToastrService) {}

  path = '/';
  cache$: Observable<Y> | null = null;

  listar(mostrarExcluidos: boolean = false): Observable<Y> {
    if (!this.cache$) {
      this.cache$ = this.backend.get<Y>(`${this.path}?mostrarExcluidos=true&size=999`).pipe(
        shareReplay(1),
        catchError((e) => {
          this.toastr.error('Erro ao carregar os registros. Por favor, tente novamente.');
          return throwError(() => e);
        })
      );
    }

    if (!mostrarExcluidos) {
      return this.listarNaoExcluidos();
    }

    return this.cache$;
  }

  listarNaoExcluidos(): Observable<Y> {
    return this.cache$!.pipe(
      map(response => ({
        ...response,
        items: response.items.filter(item => !item.excluido)
      }))
    );
  }

  criar(registro: Partial<T>): Observable<T> {
    this.limparCache();
    return this.backend.post<T>(this.path, registro).pipe(
      catchError((e) => {
        this.toastr.error('Erro ao cadastrar o registro.');
        return throwError(() => e);
      })
    );
  }

  atualizar(id: number, procedimento: Partial<T>): Observable<T> {
    this.limparCache();
    return this.backend.put<T>(`${this.path}/${id}`, procedimento).pipe(
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
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao excluir o registro. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }

  restaurar(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao restaurar o registro. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }

  limparCache() {
    this.cache$ = null;
  }
}
