import { catchError, Observable, throwError } from 'rxjs';
import { HttpErrorResponse, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  constructor(private router: Router, private toastr: ToastrService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(req).pipe(
      catchError((error: HttpErrorResponse) => {
        console.log('intercept', error);
        if (error.status === 401) {
          this.toastr.error('Sessão expirada, faça login novamente');
          this.router.navigateByUrl('/login');
        } else if (error.status === 403) {
          this.toastr.error('Você não tem permissão');
        }
        return throwError(() => error);
      })
    );
  }
}
