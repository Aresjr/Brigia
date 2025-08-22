import { Injectable } from '@angular/core';
import { Especialidade, EspecialidadesResponse } from './especialidade.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class EspecialidadeService extends BaseService<Especialidade, EspecialidadesResponse> {

  override path = '/especialidades';
}
