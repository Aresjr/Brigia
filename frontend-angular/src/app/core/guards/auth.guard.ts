import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private toastr: ToastrService) {}

  canActivate(route: ActivatedRouteSnapshot): boolean {
    return this.checkAuth(route);
  }

  canActivateChild(route: ActivatedRouteSnapshot): boolean {
    return this.checkAuth(route);
  }

  private checkAuth(route: ActivatedRouteSnapshot): boolean {
    if (localStorage.getItem('email') === null) {
      this.toastr.error('Você precisa estar logado para acessar essa página.');
      this.router.navigate(['/login']);
      return false;
    }

    const expectedRoles = route.data['roles'] as string[];
    const userRoles = JSON.parse(localStorage.getItem('roles') || '[]');

    const hasAccess = expectedRoles.some((role) => userRoles.includes(role));

    if (!hasAccess) {
      this.toastr.error('Você não tem acesso a esta página.');
      this.router.navigate(['/']);
      return false;
    }

    return true;
  }
}
