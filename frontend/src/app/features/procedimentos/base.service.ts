import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';
import { Injectable } from '@angular/core';
import { Entidade, EntidadeRequest, PagedResponse } from '../shared/entidade.interface';
import { AuthService } from '../auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class BaseService<Entid extends Entidade, Request extends EntidadeRequest | null> {

  constructor(protected backend: BackendService, protected toastr: ToastrService,
              protected authService: AuthService) {
    authService.logout$.subscribe(() => this.limparCache());
  }

  path = '/';
  cache$: Observable<PagedResponse<Entid>> | null = null;
  erroCarregarRegistros: boolean = false;

  listar(mostrarExcluidos: boolean = false, limpaCache: boolean = false): Observable<PagedResponse<Entid>> {
    console.log('this.erroCarregarRegistros', this.erroCarregarRegistros);
    if (limpaCache || this.erroCarregarRegistros) {
      this.erroCarregarRegistros = false;
      this.limparCache();
    }

    console.log('this.cache$', this.cache$);

    if (this.cache$) {
      return this.cache$;
    }

    this.cache$ = this.backend.get<PagedResponse<Entid>>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=9999`).pipe(
      shareReplay(1),
      catchError((e) => {
        console.log('catchError');
        this.erroCarregarRegistros = true;
        return throwError(() => e);
      })
    );

    return this.cache$;
  }

  criar(registro: Partial<Request>): Observable<Entid> {
    this.limparCache();
    return this.backend.post<Request, Entid>(this.path, registro).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao salvar');
        return throwError(() => e);
      })
    );
  }

  atualizar(id: number, registro: Partial<Request>): Observable<Entid> {
    this.limparCache();
    return this.backend.put<Request, Entid>(`${this.path}/${id}`, registro).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao atualizar');
        return throwError(() => e);
      })
    );
  }

  excluir(id: number): Observable<void> {
    this.limparCache();
    return this.backend.delete(`${this.path}/${id}`).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao excluir. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }

  restaurar(id: number): Observable<void> {
    this.limparCache();
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao restaurar. Por favor, tente novamente.');
        return throwError(() => e);
      })
    );
  }

  limparCache() {
    this.cache$ = null;
  }
}
