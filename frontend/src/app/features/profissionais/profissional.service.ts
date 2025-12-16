import { Injectable } from '@angular/core';
import { ProfissionalRequest, Profissional } from './profissional.interface';
import { BaseService } from '../shared/base.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProfissionalService extends BaseService<Profissional, ProfissionalRequest> {

  override path = '/profissionais';

  reenviarConvite(id: number): Observable<void> {
    return this.backend.post<void, void>(`${this.path}/${id}/reenviar-convite`, null);
  }
}
