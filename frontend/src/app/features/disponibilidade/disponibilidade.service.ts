import { Injectable } from '@angular/core';
import { Disponibilidade, DisponibilidadeRequest } from './disponibilidade.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class DisponibilidadeService extends BaseService<Disponibilidade, DisponibilidadeRequest> {

  override path = '/disponibilidades';
}
