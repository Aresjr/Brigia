import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment';
import { catchError, EMPTY, map, Observable, throwError } from 'rxjs';
import {Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class BackendService {

  constructor(private http: HttpClient, private router: Router, private toastr: ToastrService) { }

  baseUrl = environment.apiUrl;

  get<Response>(path: string): Observable<Response> {
    return this.http.get<Response>(`${this.baseUrl}${path}`, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as Response),
        catchError((error) => this.handleError(path, error))
      );
  }

  post<Request, Response>(path: string, payload: Partial<Request>) {
    return this.http.post<Request>(`${this.baseUrl}${path}`, payload, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as Response),
        catchError((error) => this.handleError(path, error))
      );
  }

  put<Request, Response>(path: string, payload: Partial<Request>) {
    return this.http.put<Request>(`${this.baseUrl}${path}`, payload, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => response.body as Response),
        catchError((error) => this.handleError(path, error))
      );
  }

  delete(path: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}${path}`, { withCredentials: true, observe: 'response' })
      .pipe(
        map(() => undefined),
        catchError((error) => this.handleError(path, error))
      );
  }

  patch<T>(path: string, payload: Partial<T> | null): Observable<void> {
    return this.http.patch<T>(`${this.baseUrl}${path}`, payload, { withCredentials: true, observe: 'response' })
      .pipe(
        map((response) => undefined),
        catchError((error) => this.handleError(path, error))
      );
  }

  private handleError(path: string, error: { status: number; }) {
    if (error.status === 401) {
      this.toastr.error('Sessão expirada, faça login novamente');
      this.router.navigate(['/login']);
      return EMPTY;
    }
    return throwError(() => error);
  }
}
