import { Injectable } from '@angular/core';
import { Atendimento, AtendimentoRequest } from './atendimento.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class AtendimentosService extends BaseService<Atendimento, AtendimentoRequest> {

  override path = '/atendimentos';
}
