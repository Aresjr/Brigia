import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Agendamento, AgendamentoRequest } from './agendamento.interface';

@Injectable({
  providedIn: 'root'
})
export class AgendamentosService extends BaseService<Agendamento, AgendamentoRequest> {

  override path = '/agendamentos';
  override cache$ = null;
}
