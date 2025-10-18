import { Injectable } from '@angular/core';
import { ContaReceber } from './contas-receber.interface';
import { BaseService } from '../shared/base.service';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ContaReceberService extends BaseService<ContaReceber, null> {

  override path = '/contas-receber';

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
    return this.backend.post(`${this.path}/gerar-pdf`, { ids }, { responseType: 'blob' }).pipe(
      catchError((e) => {
        const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || 'Erro ao gerar PDF';
        this.toastr.error(errorMessage);
        return throwError(() => e);
      })
    );
  }
}
