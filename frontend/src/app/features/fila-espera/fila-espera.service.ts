import { Injectable } from '@angular/core';
import { BaseService } from '../shared/base.service';
import { FilaEspera, FilaEsperaRequest } from './fila-espera.interface';

@Injectable({
  providedIn: 'root'
})
export class FilaEsperaService extends BaseService<FilaEspera, FilaEsperaRequest> {

  override path = '/fila-espera';
}
