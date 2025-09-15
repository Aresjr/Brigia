import { Injectable } from '@angular/core';
import { Role } from './constans';
import { Usuario } from '../features/auth/auth.service';

@Injectable({ providedIn: 'root' })
export class UserService {

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

  logout() {
    localStorage.clear();
  }
}
