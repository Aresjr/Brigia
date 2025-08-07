import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { Especialidades, EspecialidadesResponse } from './especialidade.interface';

@Injectable({
  providedIn: 'root'
})
export class EspecialidadeService {
  constructor(private backend: BackendService) {}

  path = '/especialidades';

  listar(mostrarExcluidos: boolean = false): Observable<EspecialidadesResponse> {
    return this.backend.get<EspecialidadesResponse>(`${this.path}?mostrarExcluidos=${mostrarExcluidos}&size=999`);
  }

  criar(especialidade: Partial<Especialidades>): Observable<Especialidades> {
    return this.backend.post<Especialidades>(this.path, especialidade);
  }

  atualizar(id: number, especialidade: Partial<Especialidades>): Observable<Especialidades> {
    return this.backend.put<Especialidades>(`${this.path}/${id}`, especialidade);
  }

  excluir(id: number): Observable<void> {
    return this.backend.delete<void>(`${this.path}/${id}`);
  }

  restaurar(id: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${id}/restaurar`, null);
  }
}
