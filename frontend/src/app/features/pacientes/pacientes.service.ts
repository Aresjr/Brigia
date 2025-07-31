import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PacienteResponse } from './paciente.interface';
import {BackendService} from '../../core/backend/backend.service';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {
  constructor(private backend: BackendService) {}

  listarPacientes(): Observable<PacienteResponse> {
    return this.backend.get<PacienteResponse>(`pacientes?size=999`);
  }
}
