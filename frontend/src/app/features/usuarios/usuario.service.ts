import { Injectable } from '@angular/core';
import { Usuario, UsuarioRequest } from './usuario.interface';
import { BaseService } from '../shared/base.service';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService extends BaseService<Usuario, UsuarioRequest> {

  override path = '/usuarios';

  getByToken(token: string): Observable<Usuario> {
    this.limparCache();
    return this.backend.get<Usuario>(`${this.path}/token/${token}`).pipe(
      catchError((e) => {
        return throwError(() => e);
      })
    );
  }

  reenviarConvite(id: number): Observable<void> {
    return this.backend.post<void, void>(`${this.path}/${id}/reenviar-convite`, null);
  }

}
