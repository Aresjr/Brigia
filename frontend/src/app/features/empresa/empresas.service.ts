import { Injectable } from '@angular/core';
import { Empresa, EmpresaResponse } from './empresa.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class EmpresasService extends BaseService<Empresa, EmpresaResponse> {

  override path = '/empresas';
}
