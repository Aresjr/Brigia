import { Injectable } from '@angular/core';
import { ProfissionalRequest, Profissional } from './profissional.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ProfissionalService extends BaseService<Profissional, ProfissionalRequest> {

  override path = '/profissionais';
}
