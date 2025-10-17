import { Injectable } from '@angular/core';
import { Convenio, ConvenioRequest } from './convenio.interface';
import { BaseService } from '../shared/base.service';

@Injectable({
  providedIn: 'root'
})
export class ConvenioService extends BaseService<Convenio, ConvenioRequest> {

  override path = '/convenios';
}
