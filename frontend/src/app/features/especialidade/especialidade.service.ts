import { Injectable } from '@angular/core';
import { Especialidade, EspecialidadeRequest, EspecialidadesResponse } from './especialidade.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class EspecialidadeService extends BaseService<Especialidade, EspecialidadeRequest, EspecialidadesResponse> {

  override path = '/especialidades';
}
