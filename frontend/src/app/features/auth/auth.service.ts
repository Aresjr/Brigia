import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject, tap } from 'rxjs';
import { environment } from '../../../environments/environment';
import { Role } from '../../core/constans';

interface LoginRequest {
  email: string;
  password: string;
}

export interface Usuario {
  email: string;
  name: string;
  avatarUrl: string;
  roles: Role[];
  unidade: number;
}

export interface CadastrarSenhaRequest {
  token: string;
  senha: string;
}

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  logout$ = new Subject<void>();

  constructor(private http: HttpClient) {}

  login(payload: LoginRequest): Observable<Usuario> {
    return this.http.post<Usuario>(`${environment.apiUrl}/auth/login`, payload, {
      withCredentials: true,
    });
  }

  logout(): Observable<any> {
    return this.http.post(`${environment.apiUrl}/auth/logout`, {}, { withCredentials: true }).pipe(
      tap(() => {
        this.logout$.next();
      })
    );
  }

  cadastrarSenha(token: string, senha: string): Observable<void> {
    const payload: CadastrarSenhaRequest = { token, senha };
    return this.http.post<void>(`${environment.apiUrl}/auth/cadastrar-senha`, payload);
  }
}
