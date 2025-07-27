import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router, private toastr: ToastrService) {}

  canActivate(): boolean {
    return this.checkAuth();
  }

  canActivateChild(): boolean {
    return this.checkAuth();
  }

  private checkAuth(): boolean {
    const token = null; //localStorage.getItem('token'); // ou outro método de verificação

    if (token) {
      return true;
    } else {
      this.toastr.error('Você precisa estar logado para acessar essa página.');
      this.router.navigate(['/']);
      return false;
    }
  }
}
