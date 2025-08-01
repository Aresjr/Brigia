import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PacienteResponse, Paciente } from './paciente.interface';
import { BackendService } from '../../core/backend/backend.service';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {
  constructor(private backend: BackendService) {}

  listarPacientes(): Observable<PacienteResponse> {
    return this.backend.get<PacienteResponse>(`pacientes?size=999`);
  }

  criarPaciente(paciente: Partial<Paciente>): Observable<Paciente> {
    return this.backend.post<Paciente>(`pacientes`, paciente);
  }

  atualizarPaciente(id: number, paciente: Partial<Paciente>): Observable<Paciente> {
    console.log('Atualizando paciente:', paciente);
    return this.backend.put<Paciente>(`pacientes/${id}`, paciente);
  }
}
