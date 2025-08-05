import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PacienteResponse, Paciente } from './paciente.interface';
import { BackendService } from '../../core/backend/backend.service';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {
  constructor(private backend: BackendService) {}

  path = '/pacientes';

  listar(): Observable<PacienteResponse> {
    return this.backend.get<PacienteResponse>(`${this.path}?size=999`);
  }

  criar(paciente: Partial<Paciente>): Observable<Paciente> {
    return this.backend.post<Paciente>(this.path, paciente);
  }

  atualizar(id: number, paciente: Partial<Paciente>): Observable<Paciente> {
    return this.backend.put<Paciente>(`${this.path}/${id}`, paciente);
  }
}
