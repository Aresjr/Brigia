import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Paciente, PacienteResponse } from './paciente.interface';

@Injectable({
  providedIn: 'root'
})
export class PacienteService extends BaseService<Paciente, PacienteResponse> {

  override path = '/pacientes';
}
