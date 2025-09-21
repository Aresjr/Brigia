import { Injectable } from '@angular/core';
import { Role } from './constans';
import { AuthService, Usuario } from '../features/auth/auth.service';
import { Router } from '@angular/router';
import { catchError, map, Observable, throwError } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class UserService {

  constructor(private router: Router,
              private authService: AuthService) {}

  isLogged(): boolean {
    return this.getUser() != null;
  }

  setUser(usuario: Usuario) {
    localStorage.setItem('usuario', JSON.stringify(usuario));
  }

  getUser(): Usuario | null {
    const raw = localStorage.getItem('usuario');
    return raw ? JSON.parse(raw) : null;
  }

  getRoles(): Role[] {
    if (this.getUser() == null) {
      return [];
    }
    const raw = this.getUser()?.roles;
    if (raw == undefined) {
      return [];
    }
    return raw.map((r: string) => r as Role);
  }

  hasRole(role: Role): boolean {
    return this.getRoles().includes(role);
  }

  isMedico(): boolean {
    return this.hasRole(Role.MEDICO);
  }

  logout(): Observable<void> {
    return this.authService.logout().pipe(
      map(() => {
        localStorage.clear();
        this.router.navigate(['/login']);
      }),
      catchError((e) => {
        localStorage.clear();
        this.router.navigate(['/login']);
        return throwError(() => e);
      })
    );
  }
}
