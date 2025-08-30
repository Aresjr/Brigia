import { Injectable } from '@angular/core';
import { Empresa, EmpresaRequest } from './empresa.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class EmpresasService extends BaseService<Empresa, EmpresaRequest> {

  override path = '/empresas';
}
