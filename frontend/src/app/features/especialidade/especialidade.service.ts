import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Especialidade, EspecialidadesResponse } from './especialidade.interface';

@Injectable({
  providedIn: 'root'
})
export class EspecialidadeService {
  constructor(private backend: BackendService) {}

  path = '/especialidades';

  listar(mostrarExcluidos: boolean = false): Observable<EspecialidadesResponse> {
    return this.backend.get<EspecialidadesResponse>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=999`);
  }

  criar(especialidade: Partial<Especialidade>): Observable<Especialidade> {
    return this.backend.post<Especialidade>(this.path, especialidade);
  }

  atualizar(id: number, especialidade: Partial<Especialidade>): Observable<Especialidade> {
    return this.backend.put<Especialidade>(`${this.path}/${id}`, especialidade);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }
}
