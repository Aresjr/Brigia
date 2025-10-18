import { Injectable, inject } from '@angular/core';
import { ContaReceber } from './contas-receber.interface';
import { BaseService } from '../shared/base.service';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class ContaReceberService extends BaseService<ContaReceber, null> {

  override path = '/contas-receber';
  private http = inject(HttpClient);

  constructor(backend: BackendService, toastr: ToastrService, authService: AuthService) {
    super(backend, toastr, authService);
  }

  registrarRecebimento(contaReceberId: number, valor: number): Observable<ContaReceber> {
    this.limparCache();
    return this.backend.post<{valorRecebido: number}, ContaReceber>(`${this.path}/registrar-recebimento/${contaReceberId}`, {valorRecebido: valor}).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
        this.toastr.error(errorMessage, 'Erro ao registrar o recebimento.');
        return throwError(() => e);
      })
    );
  }

  gerarPDF(ids: number[]): Observable<Blob> {
    return this.http.post(`${environment.apiUrl}${this.path}/gerar-pdf`, { ids }, {
      responseType: 'blob',
      withCredentials: true
    }).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || 'Erro ao gerar PDF';
        this.toastr.error(errorMessage);
        return throwError(() => e);
      })
    );
  }
}
