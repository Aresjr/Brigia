import { Injectable } from '@angular/core';
import { Convenio, ConvenioResponse } from './convenio.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ConveniosService extends BaseService<Convenio, ConvenioResponse> {

  override path = '/convenios';
}
