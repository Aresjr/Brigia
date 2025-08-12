import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Empresa, EmpresaResponse } from './empresa.interface';

@Injectable({
  providedIn: 'root'
})
export class EmpresasService {
  constructor(private backend: BackendService) {}

  path = '/empresas';

  listar(mostrarExcluidos: boolean = false): Observable<EmpresaResponse> {
    return this.backend.get<EmpresaResponse>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=999`);
  }

  criar(empresa: Partial<Empresa>): Observable<Empresa> {
    return this.backend.post<Empresa>(this.path, empresa);
  }

  atualizar(id: number, empresa: Partial<Empresa>): Observable<Empresa> {
    return this.backend.put<Empresa>(`${this.path}/${id}`, empresa);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }
}
