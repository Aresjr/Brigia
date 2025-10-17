import { Injectable } from '@angular/core';
import { Honorario, HonorarioRequest } from './honorario.interface';
import { BaseService } from '../shared/base.service';

@Injectable({
  providedIn: 'root'
})
export class HonorarioService extends BaseService<Honorario, HonorarioRequest> {
  override path = '/honorarios';
}
