import { Injectable } from '@angular/core';
import { BaseService } from '../procedimentos/base.service';
import { Paciente, PacienteRequest } from './paciente.interface';

@Injectable({
  providedIn: 'root'
})
export class PacienteService extends BaseService<Paciente, PacienteRequest> {

  override path = '/pacientes';
}
