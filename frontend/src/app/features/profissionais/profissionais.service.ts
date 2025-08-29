import { Injectable } from '@angular/core';
import { ProfissionalResponse, Profissional, ProfissionalRequest } from './profissional.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ProfissionaisService extends BaseService<Profissional, ProfissionalRequest, ProfissionalResponse> {

  override path = '/profissionais';
}
