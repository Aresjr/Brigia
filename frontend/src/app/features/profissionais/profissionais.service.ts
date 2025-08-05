import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ProfissionalResponse, Profissional } from './profissional.interface';
import { BackendService } from '../../core/backend/backend.service';

@Injectable({
  providedIn: 'root'
})
export class ProfissionaisService {
  constructor(private backend: BackendService) {}

  path = '/profissionais';

  listar(): Observable<ProfissionalResponse> {
    return this.backend.get<ProfissionalResponse>(`${this.path}?size=999`);
  }

  criar(profissional: Partial<Profissional>): Observable<Profissional> {
    return this.backend.post<Profissional>(this.path, profissional);
  }

  atualizar(id: number, profissional: Partial<Profissional>): Observable<Profissional> {
    return this.backend.put<Profissional>(`${this.path}/${id}`, profissional);
  }
}
