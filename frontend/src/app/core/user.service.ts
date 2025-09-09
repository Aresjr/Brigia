import { Injectable } from '@angular/core';
import { Role } from './constans';

@Injectable({ providedIn: 'root' })
export class UserService {

  isLogged(): boolean {
    return localStorage.getItem('roles') != null;
  }

  setUserRoles(roles: Role[]) {
    localStorage.setItem('roles', JSON.stringify(roles));
  }

  getUserRoles(): Role[] {
    const raw = JSON.parse(localStorage.getItem('roles') || '[]');
    return raw.map((r: string) => r as Role);
  }

  hasRole(role: Role): boolean {
    return this.getUserRoles().includes(role);
  }

  isMedico(): boolean {
    return this.hasRole(Role.MEDICO);
  }
}
