import { Injectable } from '@angular/core';
import { Especialidade, EspecialidadeRequest } from './especialidade.interface';
import { BaseService } from '../shared/base.service';

@Injectable({
  providedIn: 'root'
})
export class EspecialidadeService extends BaseService<Especialidade, EspecialidadeRequest> {

  override path = '/especialidades';
}
