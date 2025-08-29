import { Injectable } from '@angular/core';
import { Empresa, EmpresaRequest, EmpresaResponse } from './empresa.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class EmpresasService extends BaseService<Empresa, EmpresaRequest, EmpresaResponse> {

  override path = '/empresas';
}
