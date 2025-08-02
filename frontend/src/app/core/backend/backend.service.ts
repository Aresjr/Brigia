import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment';
import {catchError, map, Observable, throwError} from 'rxjs';
import {Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class BackendService {

  constructor(private http: HttpClient, private router: Router, private toastr: ToastrService) { }

  baseUrl = environment.apiUrl;

  get<T>(path: string): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}${path}`, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as T),
        catchError((error) => this.handleError(error))
      );
  }

  post<T>(path: string, payload: Partial<T>) {
    return this.http.post<T>(`${this.baseUrl}${path}`, payload, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as T),
        catchError((error) => this.handleError(error))
      );
  }

  put<T>(path: string, payload: Partial<T>) {
    return this.http.put<T>(`${this.baseUrl}${path}`, payload, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as T),
        catchError((error) => this.handleError(error))
      );
  }

  delete<T>(path: string): Observable<T> {
    return this.http.delete<T>(`${this.baseUrl}${path}`, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as T),
        catchError((error) => this.handleError(error))
      );
  }

  private handleError(error: { status: number; }) {
    if (error.status === 401) {
      this.toastr.error('Sessão expirada, faça login novamente.');
      this.router.navigate(['/login']);
    }
    return throwError(() => error);
  }
}
