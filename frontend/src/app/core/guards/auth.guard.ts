import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Role } from '../constans';
import { UserService } from '../user.service';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private toastr: ToastrService, private userService: UserService) {}

  canActivate(route: ActivatedRouteSnapshot): boolean {
    return this.checkAuth(route);
  }

  canActivateChild(route: ActivatedRouteSnapshot): boolean {
    return this.checkAuth(route);
  }

  private checkAuth(route: ActivatedRouteSnapshot): boolean {
    if (!this.userService.isLogged()) {
      this.toastr.error('Você precisa estar logado para acessar essa página.');
      this.router.navigateByUrl('/login');
      return false;
    }

    const expectedRoles = route.data['roles'] as Role[];

    const userRoles = this.userService.getRoles();
    const hasAccess = expectedRoles.some((role) => userRoles.includes(role));

    if (!hasAccess) {
      this.toastr.error('Você não tem acesso a esta página.');
      this.router.navigate(['/']);
      return false;
    }

    return true;
  }
}
