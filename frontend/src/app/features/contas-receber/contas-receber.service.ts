import { Injectable } from '@angular/core';
import { ContaReceber, ContaReceberRequest } from './contas-receber.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ContaReceberService extends BaseService<ContaReceber, ContaReceberRequest> {

  override path = '/contas-receber';
}
