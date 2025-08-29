import { Injectable } from '@angular/core';
import { Convenio, ConvenioRequest, ConvenioResponse } from './convenio.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class ConveniosService extends BaseService<Convenio, ConvenioRequest, ConvenioResponse> {

  override path = '/convenios';
}
