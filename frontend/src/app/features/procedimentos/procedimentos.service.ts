import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import {
  PrecoProcedimentoConvenio,
  Procedimento,
  ProcedimentoResponse,
  TabelaPrecoResponse
} from './procedimento.interface';

@Injectable({
  providedIn: 'root'
})
export class ProcedimentosService {
  constructor(private backend: BackendService) {}

  path = '/procedimentos';

  listar(): Observable<ProcedimentoResponse> {
    return this.backend.get<ProcedimentoResponse>(`${this.path}?size=999`);
  }

  criar(procedimento: Partial<Procedimento>): Observable<Procedimento> {
    return this.backend.post<Procedimento>(this.path, procedimento);
  }

  atualizar(id: number, procedimento: Partial<Procedimento>): Observable<Procedimento> {
    return this.backend.put<Procedimento>(`${this.path}/${id}`, procedimento);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }

  listarTabelaPreco(id: number): Observable<TabelaPrecoResponse> {
    return this.backend.get<TabelaPrecoResponse>(`${this.path}/${id}/tabela-preco`);
  }

  atualizarPreco(precoConvenio: PrecoProcedimentoConvenio): Observable<void> {
    return this.backend.patch<PrecoProcedimentoConvenio>(`${this.path}/${precoConvenio.id}/atualizar-preco`, precoConvenio);
  }
}
