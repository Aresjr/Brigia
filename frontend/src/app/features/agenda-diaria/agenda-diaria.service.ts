import { Injectable } from '@angular/core';
import { BackendService } from '../../core/backend/backend.service';
import { Observable } from 'rxjs';
import { Disponibilidade } from './disponibilidade.interface';

@Injectable({
  providedIn: 'root'
})
export class AgendaDiariaService {
  private readonly baseUrl = 'disponibilidades';

  constructor(private backend: BackendService) {}

  getDisponibilidades(profissionalId: number, data: string): Observable<Disponibilidade[]> {
    return this.backend.get(`${this.baseUrl}?profissionalId=${profissionalId}&data=${data}`);
  }

  salvarDisponibilidade(disponibilidade: Disponibilidade): Observable<Disponibilidade> {
    if (disponibilidade.id) {
      return this.backend.put(`${this.baseUrl}/${disponibilidade.id}`, disponibilidade);
    }
    return this.backend.post(this.baseUrl, disponibilidade);
  }

  excluirDisponibilidade(id: number): Observable<void> {
    return this.backend.delete(`${this.baseUrl}/${id}`);
  }
}
