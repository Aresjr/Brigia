import { Injectable } from '@angular/core';
import { Orcamento, OrcamentoRequest } from './orcamento.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class OrcamentoService extends BaseService<Orcamento, OrcamentoRequest> {
  override path = '/orcamentos';
}
