import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Agendamento, AgendamentoRequest, AgendamentoResponse } from './agendamento.interface';

@Injectable({
  providedIn: 'root'
})
export class AgendamentosService extends BaseService<Agendamento, AgendamentoRequest, AgendamentoResponse> {

  override path = '/agendamentos';
}
