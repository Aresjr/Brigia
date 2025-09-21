import { Injectable } from '@angular/core';
import { ContaReceber } from './contas-receber.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ContaReceberService extends BaseService<ContaReceber, null> {

  override path = '/contas-receber';
}
