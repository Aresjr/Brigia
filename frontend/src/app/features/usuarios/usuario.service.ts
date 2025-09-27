import { Injectable } from '@angular/core';
import { Usuario, UsuarioRequest } from './usuario.interface';
import { BaseService } from '../procedimentos/base.service';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService extends BaseService<Usuario, UsuarioRequest> {

  override path = '/usuarios';
}
