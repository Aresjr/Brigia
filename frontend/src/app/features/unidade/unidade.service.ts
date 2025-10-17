import { Injectable } from '@angular/core';
import { BaseService } from '../shared/base.service';
import { Unidade } from './unidade.interface';

@Injectable({
  providedIn: 'root'
})
export class UnidadeService extends BaseService<Unidade, null> {

  override path = '/unidades';
}
