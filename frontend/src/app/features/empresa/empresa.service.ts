import { Injectable } from '@angular/core';
import { Empresa, EmpresaRequest, EmpresaPlano } from './empresa.interface';
import { BaseService } from '../shared/base.service';
import { Observable } from 'rxjs';
import { PagedResponse } from '../shared/entidade.interface';

@Injectable({
  providedIn: 'root'
})
export class EmpresaService extends BaseService<Empresa, EmpresaRequest> {

  override path = '/empresas';

  getPlanos(): Observable<PagedResponse<EmpresaPlano>> {
    return this.backend.get<PagedResponse<EmpresaPlano>>(`${this.path}/planos`);
  }
}
