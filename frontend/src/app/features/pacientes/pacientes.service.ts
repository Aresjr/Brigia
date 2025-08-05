import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PacienteResponse, Paciente } from './paciente.interface';
import { BackendService } from '../../core/backend/backend.service';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {
  constructor(private backend: BackendService) {}

  listar(): Observable<PacienteResponse> {
    return this.backend.get<PacienteResponse>(`/pacientes?size=999`);
  }

  criar(paciente: Partial<Paciente>): Observable<Paciente> {
    return this.backend.post<Paciente>(`/pacientes`, paciente);
  }

  atualizar(id: number, paciente: Partial<Paciente>): Observable<Paciente> {
    return this.backend.put<Paciente>(`/pacientes/${id}`, paciente);
  }
}
