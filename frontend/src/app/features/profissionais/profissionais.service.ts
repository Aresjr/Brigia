import { Injectable } from '@angular/core';
import { ProfissionalResponse, Profissional } from './profissional.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ProfissionaisService extends BaseService<Profissional, ProfissionalResponse> {

  override path = '/profissionais';
}
